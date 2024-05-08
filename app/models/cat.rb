class Cat < ApplicationRecord
  belongs_to :user
  has_many :matches, dependent: :destroy
  validates :name, presence: true
  validates :details, presence: true
  has_many_attached :img_1
end
