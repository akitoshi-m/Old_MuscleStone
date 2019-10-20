class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A[A-Za-z0-9._+]*+@[A-Za-z]*+.[A-Za-z]*\z/ }
  validates :password, format: { with: /\A^(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}$\z/ }
  
  has_secure_password
  
  has_many :workouts, dependent: :destroy #ユーザーが削除されたときにそのユーザーに紐づいた投稿も削除される
  has_many :likes
  has_many :like_workouts, through: :likes, source: 'workout'
  #ユーザーがいいねしたworkoutデータを全て取得できる
  
  has_many :active_relationships, class_name: "Raletionship",foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships,source: :follower
  #:sourceキーで参照先を指定できる
  
  #ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  #ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  #現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

end
