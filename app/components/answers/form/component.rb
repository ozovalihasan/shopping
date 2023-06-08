# frozen_string_literal: true

class Answers::Form::Component < Application::Component
  def initialize(answer:, questions:, sellers:)
    @answer = answer
    @questions = questions
    @sellers = sellers
  end
end
