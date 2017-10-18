class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :bikeid
      t.integer :serialnumber
      t.string :rating
      t.string :condition
      t.datetime :maintenance
      t.string :style
      t.string :size
      t.string :color
      t.boolean :availability
      t.datetime :lastcheck
      t.string :location
      t.float :fare
      t.string :accessories
    end
  end
end
