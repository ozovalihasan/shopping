class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :set_cart
end
