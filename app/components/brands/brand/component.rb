# frozen_string_literal: true

class Brands::Brand::Component < Application::Component
  with_collection_parameter :brand
  
  def initialize(brand:)
    @brand = brand
  end
end