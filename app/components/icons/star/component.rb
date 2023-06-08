# frozen_string_literal: true
class Icons::Star::Component < Application::Component
  def initialize(percent:)
    @percent = percent.to_i
  end

end
