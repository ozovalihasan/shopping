# frozen_string_literal: true

class Questions::Question::Component < Application::Component
  def initialize(question:)
    @question = question
  end
end
