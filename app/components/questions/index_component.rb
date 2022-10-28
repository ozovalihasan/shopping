# frozen_string_literal: true

class Questions::IndexComponent < ViewComponent::Base
  def initialize(questions:, product:)
    @questions = questions
    @product = product
  end
end
