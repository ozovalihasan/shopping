# frozen_string_literal: true

require "rails_helper"

RSpec.describe Categories::ShowComponent, type: :component do
  pending "add some examples to (or delete) #{__FILE__}"

  # it "renders something useful" do
  #   expect(
  #     render_inline(described_class.new(attr: "value")) { "Hello, components!" }.css("p").to_html
  #   ).to include(
  #     "Hello, components!"
  #   )
  # end
end

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
