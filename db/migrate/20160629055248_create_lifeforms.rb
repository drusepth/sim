class CreateLifeforms < ActiveRecord::Migration
  def change
    create_table :lifeforms do |t|
      t.string :name
      t.string :owner
      t.references :parent, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
