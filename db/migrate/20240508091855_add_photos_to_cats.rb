class AddPhotosToCats < ActiveRecord::Migration[7.1]
  def change
    add_column :cats, :img_1, :string
  end
end
