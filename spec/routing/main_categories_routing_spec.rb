require "rails_helper"

RSpec.describe MainCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/main_categories").to route_to("main_categories#index")
    end

    it "routes to #show" do
      expect(get: "/main_categories/1").to route_to("main_categories#show", id: "1")
    end
  end
end
