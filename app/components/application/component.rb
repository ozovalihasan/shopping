
class Application::Component < ViewComponent::Base
  include ApplicationHelper
  include Turbo::FramesHelper
  include Turbo::StreamsHelper
end
