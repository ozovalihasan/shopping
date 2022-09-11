# frozen_string_literal: true

class Questions::IndexComponent < ViewComponent::Base
  def initialize(questions:)
    @questions = questions
  end

end
