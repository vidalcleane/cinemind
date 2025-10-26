class Category < ApplicationRecord
  has_many :movie_categories, dependent: :destroy
  has_many :movies, through: :movie_categories

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :ordered, -> { order(:name) }

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
