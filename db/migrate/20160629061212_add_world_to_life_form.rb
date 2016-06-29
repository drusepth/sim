class AddWorldToLifeForm < ActiveRecord::Migration
  def change
    add_reference :lifeforms, :world, index: true, foreign_key: true
  end
end
