class Rating < ApplicationRecord
  belongs_to :matches
  validates :rating, presence: true, inclusion: { in: 1..5 }

  def cat
    match.cat
  end
end
