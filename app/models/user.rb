class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  validates :name, uniqueness: true
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 20}
  validates :introduction, length: {maximum: 50}
  has_many :movies, dependent: :destroy
  has_many :post_comments, dependent: :destroy
end