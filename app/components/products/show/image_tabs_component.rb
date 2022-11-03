# frozen_string_literal: true

class Products::Show::ImageTabsComponent < ViewComponent::Base
  def initialize(images:)
    @images = images
  end
end
