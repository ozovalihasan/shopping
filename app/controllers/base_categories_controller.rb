class BaseCategoriesController < ApplicationController
  before_action :set_main_category, only: %i[ show ]

  # GET /main_categories or /main_categories.json
  def index
    @main_categories = MainCategory.all.includes(:categories)
  end
end