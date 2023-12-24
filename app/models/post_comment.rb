class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :comment, presence: true
  validates :comment, length: {maximum: 200}
end