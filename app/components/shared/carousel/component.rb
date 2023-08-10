# frozen_string_literal: true

class Shared::Carousel::Component < Application::Component
  def initialize(classes: "")
    @classes = classes
  end
end
