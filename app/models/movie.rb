class Movie < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: {maximum: 200}
  has_many :post_comments, dependent: :destroy
end