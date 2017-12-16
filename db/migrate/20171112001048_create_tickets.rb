class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :ticket
      t.string :renterID
      t.string :renterName
      #t.string :cCN
      t.string :email
      t.string :bikeid
      t.integer :serialnumber
      t.datetime :checkout
      t.datetime :checkin
      t.string :location
      t.float :fare
      t.boolean :active
      t.timestamps null: false
    end
  end
end
