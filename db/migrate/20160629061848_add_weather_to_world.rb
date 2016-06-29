class AddWeatherToWorld < ActiveRecord::Migration
  def change
    add_column :worlds, :temperature, :float
  end
end
