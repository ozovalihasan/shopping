# frozen_string_literal: true

class Questions::Question::Component < Application::Component
  with_collection_parameter :question
  
  def initialize(question:)
    @question = question
  end
end
