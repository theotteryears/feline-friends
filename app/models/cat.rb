class Cat < ApplicationRecord
  belongs_to :user
  has_many :matches, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :details, presence: true
  validates :img_1, presence: true
  has_one_attached :img_1
  has_one_attached :img_2
  has_one_attached :img_3
end
