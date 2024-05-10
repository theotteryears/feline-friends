class Match < ApplicationRecord
  belongs_to :user
  belongs_to :cat
  has_one :chatroom
  validates :user_id, presence: true
  validates :cat_id, presence: true
end
