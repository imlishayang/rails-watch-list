class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true, length: { minimum: 6 }
  validates :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id} #the movie must be unique with the scope of the list_id
end
