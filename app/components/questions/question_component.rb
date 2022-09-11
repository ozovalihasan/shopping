# frozen_string_literal: true

class Questions::QuestionComponent < ViewComponent::Base
  def initialize(question:)
    @question = question
  end
end
