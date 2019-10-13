class Workout < ApplicationRecord
  
  validates :user_id, presence: true
  validates :description, presence: true
  # validates :image, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  has_many :likes
  has_many :like_users, through: :likes, source: 'user'
  
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: 'user'
end
