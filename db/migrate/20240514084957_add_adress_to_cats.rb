class AddAdressToCats < ActiveRecord::Migration[7.1]
  def change
    add_column :cats, :address, :string
  end
end
