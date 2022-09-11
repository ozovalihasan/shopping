# frozen_string_literal: true

class Answers::AnswerComponent < ViewComponent::Base
  def initialize(answer:)
    @answer = answer
  end
end
