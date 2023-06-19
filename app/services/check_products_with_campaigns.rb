class CheckProductsWithCampaigns < ApplicationService
  def call
    time = Time.current

    if update_campaigns_activeness_necessary?(time)
      update_campaigns_activeness(time)
      update_product_prices(time)
    end
  end

  def initialize
  end

  private

  def update_campaigns_activeness_necessary?(time)
    Campaign.where("(
      active = false AND '#{ time }' BETWEEN campaigns.start_time AND campaigns.end_time
    ) OR (
      active = true AND '#{ time }' > campaigns.end_time
    )").exists?
  end

  def update_campaigns_activeness(time)
    Campaign.update_all("
      active = '#{ time }' BETWEEN campaigns.start_time AND campaigns.end_time
    ")
  end
  
  def update_product_prices(time)
    ActiveRecord::Base.connection.exec_query(
      <<-SQL
        UPDATE products 
        SET 
          discount_price = (((100 - COALESCE(products_with_discount_query.max_discount, 0)) * products.price) / 100 ),
          discount = products_with_discount_query.max_discount,
          campaign_id = products_with_discount_query.campaign_id
        FROM (
          #{ products_with_discount(time) }
        ) AS products_with_discount_query
        WHERE products.id = products_with_discount_query.product_id
      SQL
    )
  end

  def products_with_discount(time)
    <<-SQL
      SELECT products.id AS product_id, find_max_discount_query.campaign_id, find_max_discount_query.max_discount
      FROM products
      LEFT OUTER JOIN ( #{ find_max_discount(time) } ) AS find_max_discount_query ON products.id = find_max_discount_query.product_id  
    SQL
  end

  def find_max_discount(time)
    <<-SQL
      SELECT product_id, campaign_id, discount AS max_discount
      FROM (
        SELECT 
          campaign_items.product_id, 
          campaign_items.campaign_id, 
          campaigns.discount, 
          ROW_NUMBER() OVER ( PARTITION BY campaign_items.product_id ORDER BY campaigns.discount DESC ) AS row_number
        FROM campaigns
        LEFT OUTER JOIN campaign_items 
        ON campaigns.id = campaign_items.campaign_id
        WHERE 
          ( '#{ time }' BETWEEN campaigns.start_time AND campaigns.end_time ) AND 
          (campaign_items.product_id IS NOT NULL)
      ) AS result
      WHERE result.row_number = 1
    SQL

  end
end
