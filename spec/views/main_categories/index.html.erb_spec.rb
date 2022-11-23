require 'rails_helper'

RSpec.describe "main_categories/index", type: :view do
   before(:all) {
    FactoryBot.reload
    FactoryBot.create(:mock_main_category)
    FactoryBot.create_list(:mock_category, 1)
    FactoryBot.create(:mock_seller)
    FactoryBot.create(:mock_product)
  }

  it "renders the index view of MainCategoriesController correctly" do

    main_categories = MainCategory.all
    assign(:main_categories, main_categories)

    products = Product.all
    assign(:products, products)
    
    allow(MainCategories::IndexComponent).to receive(:new) { MockComponent.new( MainCategories::IndexComponent ) }
    
    render
    expect(rendered).to match( MainCategories::IndexComponent.name )
      
    expect(rendered).to match_snapshot('index')
  end

end
