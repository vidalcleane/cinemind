class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user, optional: true

  validates :content, presence: true, length: { minimum: 3, maximum: 1000 }
  validates :author_name, presence: true, if: -> { user.nil? }

  scope :ordered, -> { order(created_at: :desc) }

  def author_display
    user ? user.display_name : author_name
  end
end
