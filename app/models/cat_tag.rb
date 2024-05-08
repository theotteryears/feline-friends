class CatTag < ApplicationRecord
  belongs_to :cat
  belongs_to :tag

  validates :tag, uniqueness: {scope: :cat, message: "already added"}
end
