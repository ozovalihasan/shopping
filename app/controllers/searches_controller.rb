class SearchesController < ApplicationController
  def new
    respond_to do |format|
      if turbo_frame_request?
        format.html 
      else
        format.html { redirect_to root_path }
      end
    end
  end
end
