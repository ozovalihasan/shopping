# frozen_string_literal: true

class MainCategorys::FormComponent < ViewComponent::Base
  def initialize(main_category:, :)
    @main_category = main_category
  end
end
