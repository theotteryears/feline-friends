class ChangeAndAddColumnToCats < ActiveRecord::Migration[7.1]
  def change
    rename_column :cats, :details, :personality
    add_column :cats, :age, :integer, null: false
  end
end
