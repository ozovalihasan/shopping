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

  it "renders something useful", :snapshot do
    allow(Categories::CategoryComponent).to receive(:with_collection) { MockComponent.new( Categories::CategoryComponent ) }
    allow(Products::ProductComponent).to receive(:with_collection) { MockComponent.new( Products::ProductComponent ) }
    # allow_any_instance_of(ViewComponent::Base).to receive(:render).and_return("one of unimportant mock components")

    render_inline(described_class.new(products: Product.all, main_categories: MainCategory.all))
    
    expect(page).to have_css("turbo-frame#main-parts")
    expect(page).to have_text( Categories::CategoryComponent.name )
    expect(page).to have_text( Products::ProductComponent.name )
      
  end

end
