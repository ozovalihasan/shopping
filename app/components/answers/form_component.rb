# frozen_string_literal: true

class Answers::FormComponent < ViewComponent::Base
  def initialize(answer:, questions:, sellers:)
    @answer = answer
    @questions = questions
    @sellers = sellers
  end
end
