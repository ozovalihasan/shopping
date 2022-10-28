# frozen_string_literal: true

class Notifications::InfoComponent < ViewComponent::Base
  def initialize(info:)
    @info = info
  end

end
