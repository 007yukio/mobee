class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  #ユーザーの値がバリデーション判定される前にemail属性を強制的に小文字に変換
  before_validation { email.downcase! }
  
  #パスワードをハッシュ化
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  has_many :movies
  has_many :favorites, dependent: :destroy  
  has_many :favorite_movies, through: :favorites, source: :movie
end


