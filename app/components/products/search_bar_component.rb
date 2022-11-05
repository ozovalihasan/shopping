# frozen_string_literal: true

class Products::SearchBarComponent < ViewComponent::Base
  def initialize(categories:)
    @categories = categories
  end
end
