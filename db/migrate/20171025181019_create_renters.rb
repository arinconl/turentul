class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.integer :renterID
      t.string :firstName
      t.string :lastName
      t.string :cCN
      t.string :ticket
      t.integer:numRents
      t.datetime :birthday
      t.string :email
      t.integer :phone
      t.timestamps null: false
    end
  end
end
