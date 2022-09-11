# frozen_string_literal: true

class Reviews::ReviewComponent < ViewComponent::Base
  def initialize(review:)
    @review = review
  end
end
