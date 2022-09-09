# frozen_string_literal: true

class Categories::IndexComponent < ViewComponent::Base
  def initialize(categories:)
    @categories = categories
  end

end
