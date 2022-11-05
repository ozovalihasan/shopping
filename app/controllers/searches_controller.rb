class SearchesController < ApplicationController
  def new
    categories = Category.all
    respond_to do |format|
      format.html { render Products::SearchBarComponent.new(categories: categories) }
    end
  end
end
