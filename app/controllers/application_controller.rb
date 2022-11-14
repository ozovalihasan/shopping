class ApplicationController < ActionController::Base
  include ApplicationHelper
  include Pagy::Backend
  
  devise_group :user, contains: [:customer, :seller, :admin]
  before_action :set_cart
  
end
