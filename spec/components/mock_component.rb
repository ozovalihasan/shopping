class MockComponent < ViewComponent::Base
  def initialize(component)
    @name = component.name
  end

  def call
    @name
  end
end