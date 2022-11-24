# frozen_string_literal: true

require "rails_helper"

RSpec.describe Products::IndexComponent, type: :component do
  let(:subcomponents) { [ Icons::SpinnerComponent, Products::ProductComponent] }

  before(:all) {
    FactoryBot.reload
    FactoryBot.create(:mock_main_category)
    FactoryBot.create_list(:mock_category, 1)
    FactoryBot.create(:mock_seller)
    FactoryBot.create(:mock_product)
  }

  before(:each) {
    mock_components(subcomponents)
  }

  it "renders all related components and attributes" do
    
    render_inline(described_class.new(products: Product.all, last_page: 2))
    
    expect(page).to have_css("turbo-frame#main-parts")
    expect(page).to have_css("div[data-pagination-max-page-value=2]")
    subcomponents.each do |subcomponent|
      expect(page).to have_text( subcomponent.name )  
    end

    expect(rendered_content).to match_snapshot('index/without_optional_parameters')
      
  end
  
  it "renders an attribute 'data-pagination-search-term-value' for the element having pagination controller" do
    
    render_inline(described_class.new(products: Product.all, last_page: 2, search_term: "mock_search_term"))
    
    expect(page).to have_css("div[data-pagination-search-term-value=mock_search_term]")

    expect(rendered_content).to match_snapshot('index/with_search_term')
      
  end

  it "renders an attribute 'data-pagination-category-id-value' for the element having pagination controller" do
    
    render_inline(described_class.new(products: Product.all, last_page: 2, category_id: 1))
    
    expect(page).to have_css("div[data-pagination-category-id-value=1]")

    expect(rendered_content).to match_snapshot('index/with_category_id')
      
  end
end
