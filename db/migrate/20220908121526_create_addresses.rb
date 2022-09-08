class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.text :body
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode

      t.timestamps
    end
  end
end
