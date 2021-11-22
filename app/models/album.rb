class Album < ApplicationRecord
  has_one_attached :cover_art
  validates :name, :released_at, :kind, presence: true
end
