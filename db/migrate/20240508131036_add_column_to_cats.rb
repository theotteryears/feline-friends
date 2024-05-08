class AddColumnToCats < ActiveRecord::Migration[7.1]
  def change
    add_column :cats, :img_2, :string
    add_column :cats, :img_3, :string
  end
end
