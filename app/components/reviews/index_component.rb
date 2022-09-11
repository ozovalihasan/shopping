# frozen_string_literal: true

class Reviews::IndexComponent < ViewComponent::Base
  def initialize(reviews:)
    @reviews = reviews
  end

end
