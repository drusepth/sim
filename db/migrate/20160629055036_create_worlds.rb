class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.string :name
      t.string :description
      t.datetime :ended_at

      t.timestamps null: false
    end
  end
end
