# frozen_string_literal: true

require "rails_helper"

RSpec.describe MainCategories::IndexComponent, type: :component do
  before(:all) {
    FactoryBot.reload
    FactoryBot.create(:mock_main_category)
    FactoryBot.create_list(:mock_category, 1)
    FactoryBot.create(:mock_seller)
    FactoryBot.create(:mock_product)
  }

  it "renders something useful" do
    subcomponents = [Categories::CategoryComponent, Products::ProductComponent]
    mock_components(subcomponents)
    # allow_any_instance_of(ViewComponent::Base).to receive(:render).and_return("one of unimportant mock components")

    render_inline(described_class.new(products: Product.all, main_categories: MainCategory.all))
    
    expect(page).to have_css("turbo-frame#main-parts")
    subcomponents.each do |subcomponent|
      expect(page).to have_text( subcomponent.name )  
    end
      
    expect(rendered_content).to match_snapshot('index')
  end

end
