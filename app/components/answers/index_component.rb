# frozen_string_literal: true

class Answers::IndexComponent < ViewComponent::Base
  def initialize(answers:)
    @answers = answers
  end

end
