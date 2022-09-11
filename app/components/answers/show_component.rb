# frozen_string_literal: true

class Answers::ShowComponent < ViewComponent::Base
  def initialize(answer:)
    @answer = answer
  end

end
