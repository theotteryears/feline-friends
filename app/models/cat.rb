class Cat < ApplicationRecord
  belongs_to :user
  has_many :matches, dependent: :destroy
  validates :name, presence: true
  validates :personality, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :img_1, presence: true
  has_one_attached :img_1
  has_one_attached :img_2
  has_one_attached :img_3
end
