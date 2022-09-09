# frozen_string_literal: true

class Categories::ShowComponent < ViewComponent::Base
  def initialize(category:)
    @category = category
  end

end
