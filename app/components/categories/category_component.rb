# frozen_string_literal: true

class Categories::CategoryComponent < ViewComponent::Base
  def initialize(category:)
    @category = category
  end

end
