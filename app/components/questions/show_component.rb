# frozen_string_literal: true

class Questions::ShowComponent < ViewComponent::Base
  def initialize(question:)
    @question = question
  end

end
