require 'rails_helper'

RSpec.describe "/main_categories", type: :request do

  let(:frame_id) { "main-parts" }

  before(:each) {
    FactoryBot.reload
    FactoryBot.create(:mock_main_category)
    FactoryBot.create_list(:mock_category, 1)
    FactoryBot.create(:mock_seller)
    FactoryBot.create(:mock_product)
  }
  

  describe "GET /index" do
    it "renders a successful response for the html format"  do
      get main_categories_path

      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)

      expect(response.body).to match_snapshot('main_categories/index/html')
    end
  
    it "renders only a frame for a request of turbo frame" do
      get main_categories_path, headers: { "Turbo-Frame" => frame_id }
      
      expect(response).to render_template(layout: false)
      expect(response).to have_http_status(:ok)
      expect(response.body).to have_css("turbo-frame##{frame_id}")

      expect(response.body).to match_snapshot('main_categories/index/turbo_frame')
    end

    it "replaces some elements for a turbo stream request" do
      get main_categories_path(format: :turbo_stream)
      
      expect(response).to render_template(layout: false)
      expect(response).to have_http_status(:ok)

      expect(response.body).to have_css("turbo-stream[target='user-account'][action='replace']")
      expect(response.body).to have_css("turbo-stream[target='main-parts'][action='replace']")
      expect(response.body).to have_css("turbo-stream[target='cart'][action='replace']")

      expect(response.body).to match_snapshot('main_categories/index/turbo_stream')
    end

  end

  describe "GET /show" do
    it "renders the view of MainCategories#show for the html format" do
      get main_category_path(MainCategory.first)

      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)

      expect(response.body).to match_snapshot('main_categories/show/html')
    end

    it "renders only a frame for a request for a turbo frame" do
      get main_category_path(MainCategory.first), headers: { "Turbo-Frame" => frame_id }

      expect(response).to render_template(layout: false)
      expect(response).to have_http_status(:ok)
      expect(response.body).to have_css("turbo-frame##{frame_id}")

      expect(response.body).to match_snapshot('main_categories/show/turbo_frame')
    end
    
    
  end
end
