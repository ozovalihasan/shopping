# frozen_string_literal: true

class Reviews::ShowComponent < ViewComponent::Base
  def initialize(review:)
    @review = review
  end

end
