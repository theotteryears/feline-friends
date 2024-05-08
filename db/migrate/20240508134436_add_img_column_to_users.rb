class AddImgColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :img, :string
  end
end
