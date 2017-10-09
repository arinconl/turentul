=begin
class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string 'title'
      t.string 'rating'
      t.text 'description'
      t.datetime 'release_date'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end
=end

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
