class AddWeatherToWorld < ActiveRecord::Migration
  def change
    add_column :worlds, :temperature, :float, default: 55.0
  end
end
