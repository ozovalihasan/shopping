class SearchesController < ApplicationController
  def new
    categories = Category.pluck(:name, :id)
    respond_to do |format|
      format.html { render Products::SearchBarComponent.new(categories: categories) }
    end
  end
end
