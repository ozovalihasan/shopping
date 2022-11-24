require 'rails_helper'

RSpec.describe "/categories", type: :request do

  describe "GET /show" do
    let(:frame_id) { "main-parts" }

    before(:all) {
      FactoryBot.reload
      FactoryBot.create(:mock_main_category)
      FactoryBot.create_list(:mock_category, 1)
      FactoryBot.create(:mock_seller)
      FactoryBot.create(:mock_product)

      subcomponents = [Categories::CategoryComponent, Products::IndexComponent]
      mock_components(subcomponents)
      
    }
    
    it "renders the view of Categories#show for the html format" do
      get category_path(Category.first)

      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    
      expect(response.body).to match_snapshot('categories/show/html')
    end

    it "renders only a frame for a request for a turbo frame" do
      

      get category_path(Category.first), headers: { "Turbo-Frame" => "asa" }

      expect(response).to render_template(:show)
      expect(response).to render_template(layout: false)
      expect(response).to have_http_status(:ok)
      
      expect(response.body).to have_css("turbo-frame##{frame_id}")
      expect(response.body).to match_snapshot('categories/show/turbo_frame')
    end

  end
  
end
