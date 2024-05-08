class RenameAddressInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :address, :city
  end
end
