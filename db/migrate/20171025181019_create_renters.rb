class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|

      t.timestamps null: false
    end
  end
end
