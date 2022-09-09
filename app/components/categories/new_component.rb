# frozen_string_literal: true

class Categories::NewComponent < ViewComponent::Base
  def initialize(category:)
    @category = category
  end

end
