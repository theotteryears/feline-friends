class Tag < ApplicationRecord
  has_many :cat_tags, dependent: :destroy
  has_many :cats, through: :cat_tags
end
