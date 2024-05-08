class User < ApplicationRecord
  has_many :cats, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_one_attached :img
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { cat_sitter: 0, cat_owner: 1 }
  def owner?
    role == 1
  end

  def sitter?
    role == 0
  end
end
