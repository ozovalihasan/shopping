# frozen_string_literal: true

class Shared::MainPage::Component < Application::Component
  def initialize(main_categories:, products:, products_of_best_deal:, best_campaign:)
    @main_categories = main_categories
    @products = products
    @products_of_best_deal = products_of_best_deal
    @best_campaign = best_campaign
  end
end
