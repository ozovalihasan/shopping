class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Pagy::Backend
  
  devise_group :user, contains: [:customer, :seller, :admin]
  before_action :set_cart
  before_action :set_all_categories_map

  def set_all_categories_map
    @all_categories = MainCategory.all.includes(:categories)
  end
  
end
