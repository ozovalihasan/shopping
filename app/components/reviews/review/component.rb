# frozen_string_literal: true

class Reviews::Review::Component < Application::Component
  with_collection_parameter :review
  
  def initialize(review:)
    @review = review
  end
end
