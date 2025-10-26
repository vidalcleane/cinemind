class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :movie_categories, dependent: :destroy
  has_many :categories, through: :movie_categories
  has_one_attached :poster

  validates :title, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 1800 }, allow_nil: true
  validates :duration, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  scope :ordered, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    ["title", "director", "year"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["categories"]
  end

  def formatted_duration
    return nil unless duration
    hours = duration / 60
    minutes = duration % 60
    "#{hours}h #{minutes}min"
  end
end
