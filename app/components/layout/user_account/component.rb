# frozen_string_literal: true

class Layout::UserAccount::Component < Application::Component
  def initialize(current_user:)
    @current_user = current_user
  end

end
