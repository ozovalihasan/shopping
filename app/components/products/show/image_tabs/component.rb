# frozen_string_literal: true

class Products::Show::ImageTabs::Component < Application::Component
  def initialize(images:)
    @images = images
  end
end
