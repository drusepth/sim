class AddWorldToVegetations < ActiveRecord::Migration
  def change
    add_reference :vegetations, :world, index: true, foreign_key: true
  end
end
