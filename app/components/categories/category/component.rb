# frozen_string_literal: true

class Categories::Category::Component < Application::Component
  with_collection_parameter :category
  
  def initialize(category:)
    @category = category
  end

end
