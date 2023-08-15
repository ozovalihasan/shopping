# frozen_string_literal: true

class Shared::Card::Component < Application::Component
  def initialize(title:)
    @title = title
  end
end
