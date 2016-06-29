class AddStuffToLifeforms < ActiveRecord::Migration
  def change
    add_column :lifeforms, :age, :integer, default: 0
    add_column :lifeforms, :hunger_score, :float, default: 50.0
    add_column :lifeforms, :temperature, :float, default: 60.0
    add_column :lifeforms, :current_health, :float, default: 100.0
    add_column :lifeforms, :maximum_health, :float, default: 100.0
  end
end
