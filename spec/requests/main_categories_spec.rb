require 'rails_helper'

RSpec.describe "/main_categories", type: :request do

  let(:frame_id) { "main-parts" }

  before(:all) {
    FactoryBot.reload
    FactoryBot.create(:mock_main_category)
    FactoryBot.create_list(:mock_category, 1)
    FactoryBot.create(:mock_seller)
    FactoryBot.create(:mock_product)
  }
  

  describe "GET /index" do
    it "renders a successful response for the html format"  do
      get main_categories_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to have_css('turbo-frame')
      expect(response.body).to include("product_name_1")
      expect(response.body).to include("main_category_name_1")
    end
  
    it "renders only a frame for a request of turbo frame" do
      get main_categories_path, headers: { "Turbo-Frame" => frame_id }
      
      expect(response).to render_template(layout: false)
      expect(response).to have_http_status(:ok)
      expect(response.body).to have_css("turbo-frame##{frame_id}")
    end

    it "replaces some elements for a turbo stream request" do
      subcomponents = [ Layout::UserAccountComponent, MainCategories::IndexComponent, Carts::NavbarComponent ] 

      mock_components(subcomponents)
      
      get main_categories_path(format: :turbo_stream)
      
      expect(response).to render_template(layout: false)
      expect(response).to have_http_status(:ok)

      expect(response.body).to have_css("turbo-stream[target='user-account'][action='replace']")
      expect(response.body).to have_css("turbo-stream[target='main-parts'][action='replace']")
      expect(response.body).to have_css("turbo-stream[target='cart'][action='replace']")
      subcomponents.each {|subcomponent| expect(response.body).to include( subcomponent.name )  }
    end

  end

  describe "GET /show" do
    it "renders the view of MainCategories#show for the html format" do
      get main_category_path(MainCategory.first)

      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end

    it "renders only a frame for a request for a turbo frame" do
      get main_category_path(MainCategory.first), headers: { "Turbo-Frame" => frame_id }

      expect(response).to render_template(layout: false)
      expect(response).to have_http_status(:ok)
      expect(response.body).to have_css("turbo-frame##{frame_id}")
    end
    
    it "shouldn't get any response for a turbo stream request" do
      begin
        get main_category_path(MainCategory.first, format: :turbo_stream)   
      rescue 
        "There shouldn't be a response for a turbo stream request"
      ensure
        expect(response).to eq(nil)
      end
      
    end

  end
end
