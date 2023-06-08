# frozen_string_literal: true

class Answers::Answer::Component < Application::Component
  with_collection_parameter :answer

  def initialize(answer:)
    @answer = answer
  end
end
