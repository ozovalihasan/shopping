require 'rails_helper'

RSpec.describe "main_categories/show", type: :view do
  
  before(:all) {
    FactoryBot.reload
    FactoryBot.create(:mock_main_category)
    FactoryBot.create_list(:mock_category, 1)
    FactoryBot.create(:mock_seller)
    FactoryBot.create(:mock_product)
  }

  it "renders the view of MainCategoriesController#show correctly" do

    main_category = MainCategory.first
    assign(:main_category, main_category)

    products, last_page = pagy_products(page: 1, products: main_category.products)
    assign(:products, products)
    assign(:last_page, last_page)
    
    allow_any_instance_of(ViewComponent::Base).to receive(:render).and_return("one of unimportant mock components")
    allow(Categories::CategoryComponent).to receive(:with_collection) { MockComponent.new( Categories::CategoryComponent ) }
    allow(Products::IndexComponent).to receive(:new) { MockComponent.new( Products::IndexComponent ) }
    
    render
    expect(rendered).to have_css("turbo-frame#main-parts")
    expect(rendered).to match( Products::IndexComponent.name )
    expect(rendered).to match( Categories::CategoryComponent.name )
      
    expect(rendered).to match_snapshot('main_categories/show')
  end

end
