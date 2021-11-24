require 'date'

class Artist < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :cover_photo
  validates :name, presence: true,
  format: { without: /\p{So}+/, message: "Without emojis😃"}
  validates :formed_at, presence:true
  validate :date_is_valid, :artist_not_time_traveller

  validate :correct_avatar_file_type, :correct_cover_photo_file_type
  
  def date_is_valid
    if !formed_at.nil?
      begin
        formed_at&.to_date
      rescue Date::Error
        errors.add(:formed_at, :invalid)
      end
    end
  end

  def artist_not_time_traveller
    date_today = Date.today
    if !formed_at.nil?
      if formed_at > date_today
        errors.add(:formed_at, "can't be in the future.")
      end
    end
  end

  private

  def correct_avatar_file_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpg image/png image/jpeg))
      errors.add(:avatar, ": Invalid file type")
    end
  end

  def correct_cover_photo_file_type
    if cover_photo.attached? && !cover_photo.content_type.in?(%w(image/jpg image/png image/jpeg))
      errors.add(:cover_photo, ": Invalid file type")
    end
  end
end
