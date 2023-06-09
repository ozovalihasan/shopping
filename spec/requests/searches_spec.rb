require 'rails_helper'

RSpec.describe "Searches", type: :request do
  let(:frame_id) { products_search_bar_target }

  before(:all) {
    FactoryBot.reload
    FactoryBot.create(:mock_main_category)
    FactoryBot.create_list(:mock_category, 2)
  }
  
  describe "GET /new" do
    it "renders a successful response for the html format"  do
      get new_search_path

      expect(response).to redirect_to root_path
      expect(response).to have_http_status(302)
    end
  
    it "renders only a frame for a request of turbo frame" do
      get new_search_path, headers: { "Turbo-Frame" => frame_id }
      
      expect(response).to render_template(layout: false)
      expect(response).to have_http_status(:ok)
      expect(response.body).to have_css("turbo-frame##{frame_id}")

      expect(response.body).to match_snapshot('searches/new/turbo_frame')
    end

  end

end
