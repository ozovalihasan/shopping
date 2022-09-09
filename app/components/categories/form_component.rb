# frozen_string_literal: true

class Categories::FormComponent < ViewComponent::Base
  def initialize(category:)
    @category = category
  end

end
