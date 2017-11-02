class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.integer :renterID
      t.string :provider
      t.string :renterName
      t.string :oauth_token
      t.string :oauth_expires_at
      t.string :cCN
      t.string :ticket
      t.integer:numRents
      t.datetime :birthday
      t.string :email
      t.string :phone
      #t.timestamps null: false
    end
  end
end
