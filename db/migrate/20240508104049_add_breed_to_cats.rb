class AddBreedToCats < ActiveRecord::Migration[7.1]
  def change
    add_column :cats, :breed, :string
  end
end
