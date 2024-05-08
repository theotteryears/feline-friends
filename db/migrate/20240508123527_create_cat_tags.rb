class CreateCatTags < ActiveRecord::Migration[7.1]
  def change
    create_table :cat_tags do |t|
      t.references :cat, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
