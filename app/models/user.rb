class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A[A-Za-z0-9._+]*+@[A-Za-z]*+.[A-Za-z]*\z/ }
  validates :password, format: { with: /\A^(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}$\z/ }
  
  has_secure_password
  
end
