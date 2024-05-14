class AddCoordinatesToCats < ActiveRecord::Migration[7.1]
  def change
    add_column :cats, :latitude, :float
    add_column :cats, :longitude, :float
  end
end
