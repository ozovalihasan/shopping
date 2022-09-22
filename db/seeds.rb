# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

5.times do
  FactoryBot.create(:admin)
  FactoryBot.create(:seller)
  FactoryBot.create(:customer)
end

10.times do
  FactoryBot.create(:main_category)
end

20.times do
  FactoryBot.create(:sub_category)
end

15.times do
  FactoryBot.create(:product)
end


30.times do
  FactoryBot.create(:review)
end

50.times do
  FactoryBot.create(:question)
end

50.times do
  FactoryBot.create(:answer)
end

5.times do
  FactoryBot.create(:order)
end

20.times do
  FactoryBot.create(:order_item)
end

5.times do
  FactoryBot.create(:address)
end


