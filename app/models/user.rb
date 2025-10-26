class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies, dependent: :destroy
  has_many :comments, dependent: :nullify
  has_many :movie_imports, dependent: :destroy 

  validates :name, presence: true
end
