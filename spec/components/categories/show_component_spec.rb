# frozen_string_literal: true

require "rails_helper"

RSpec.describe Categories::ShowComponent, type: :component do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "renders something useful" do
    
    # allow(Products::IndexComponent)
    #   .to receive(:new)
    #   .and_return("Hi")

    # allow_any_instance_of(Products::IndexComponent)
    #   .to receive(:render)

    FactoryBot.create(:main_category)    
    FactoryBot.create(:category)    

    render_inline( Categories::ShowComponent.new(category: Category.first)) do |c|
      c.with_products do 
        "Mock products"
      end
    end

    expect(rendered_component).to have_text "Mock products"
    
    # expect(
    #   p render_inline(Categories::ShowComponent.new(products: products, category: Category.first, last_page: 2)).css("div").to_html
    # ).to include(
    #   "Hello, components!"
    # )
  end
  
  # it "renders something useful" do

  #   render_inline(Categories::ShowComponent.new(products: products, category: Category.first, last_page: 2))

  #   expect(rendered_component).to have_text "name1"
    
  #   # expect(
  #   #   p render_inline(Categories::ShowComponent.new(products: products, category: Category.first, last_page: 2)).css("div").to_html
  #   # ).to include(
  #   #   "Hello, components!"
  #   # )
  # end
end
