# frozen_string_literal: true

class MainCategorys::IndexComponent < ViewComponent::Base
  def initialize(main_categories:)
    @main_categories = main_categories
  end

end
