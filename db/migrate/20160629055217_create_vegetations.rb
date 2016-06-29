class CreateVegetations < ActiveRecord::Migration
  def change
    create_table :vegetations do |t|
      t.string :name
      t.float :amount

      t.timestamps null: false
    end
  end
end
