class Artist < ApplicationRecord
  has_one_attached :avatar
  # has_one_attached :cover_photo

  validates :name, :formed_at, presence: true
end
