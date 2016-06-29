class AddDiedAtToLifeform < ActiveRecord::Migration
  def change
    add_column :lifeforms, :died_at, :datetime
  end
end
