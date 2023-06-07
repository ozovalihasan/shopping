# frozen_string_literal: true

RSpec.shared_context 'Global let helpers' do
  let(:cur_user) do
    create(:mock_user)
  end

  let(:user) do
    create(:mock_user)
  end

  let(:cur_seller) do
    create(:mock_seller)
  end

  let(:seller) do
    create(:mock_seller)
  end

  let(:cur_customer) do
    create(:mock_customer)
  end

  let(:customer) do
    create(:mock_customer)
  end

  let(:product) do
    create(:mock_product)
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.include_context 'Global let helpers', type: :component
  config.include_context 'Global let helpers', type: :view
  config.include_context 'Global let helpers', type: :feature

  config.before do
    FactoryBot.reload
  end

  config.before(:all) do
    %w[
      questions
      reviews
      users
      answers
      base_categories
      products
      orders
      order_items
      addresses
    ].each do |table|
      ActiveRecord::Base.connection.execute(
        "ALTER SEQUENCE #{table}_id_seq RESTART WITH 1000"
      )
    end
  end
end
