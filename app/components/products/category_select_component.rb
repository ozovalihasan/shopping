# frozen_string_literal: true

class Products::CategorySelectComponent < ViewComponent::Base
  def initialize(categories:, category: )
    @categories = categories
    @category = category
  end
end
