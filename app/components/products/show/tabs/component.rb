# frozen_string_literal: true

class Products::Show::Tabs::Component < Application::Component

  TAB_NAMES = {
    description: 0,
    questions: 1,
    reviews: 2
  }
  
  def initialize(product:, tab_name: nil)
    @product = product
    @tab_names = TAB_NAMES
    @tab_index = TAB_NAMES[tab_name&.to_sym] || 0 
  end
end
