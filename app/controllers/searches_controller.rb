class SearchesController < ApplicationController
  def new
    categories = Category.pluck(:name, :id)
    respond_to do |format|
      if turbo_frame_request?
        format.html 
      else
        format.html { redirect_to root_path }
      end
    end
  end
end
