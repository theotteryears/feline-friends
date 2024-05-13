class Rating < ApplicationRecord
  belongs_to :cat
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
