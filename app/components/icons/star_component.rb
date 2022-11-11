# frozen_string_literal: true
class Icons::StarComponent < ViewComponent::Base
  def initialize(percent:)
    @percent = percent.to_i
  end

end
