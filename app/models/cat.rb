class Cat < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :matches
  validates :name, presence: true
  validates :details, presence: true
end
