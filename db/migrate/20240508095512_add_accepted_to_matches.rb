class AddAcceptedToMatches < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :accepted, :boolean, default: false
  end
end
