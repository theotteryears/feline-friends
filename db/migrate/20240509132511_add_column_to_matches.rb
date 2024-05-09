class AddColumnToMatches < ActiveRecord::Migration[7.1]
  def change
    remove_column :matches, :accepted, :boolean
    add_column :matches, :status, :string, default: "pending", null: false
  end
end
