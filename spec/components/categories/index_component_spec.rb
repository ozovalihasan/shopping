# frozen_string_literal: true

require "rails_helper"

RSpec.describe Categories::IndexComponent, type: :component do

  it "renders something useful" do
    
    FactoryBot.create(:main_category)    
    FactoryBot.create(:category)    

    render_inline( Categories::IndexComponent.new(category: Category.first)) do |c|
      c.with_products do 
        "Mock products"
      end
    end

    expect(rendered_content).to have_text "Mock products"
    
  end
end
