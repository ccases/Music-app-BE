class Album < ApplicationRecord
  has_one_attached :cover_art
  validates :name, :released_at, presence: true
  # validates_format_of :cover_art, :with => /\A\.(png|jpg|jpeg)$\z/, :message => "Cover art must be in png or jpg/jpeg.", if: -> (x) {x.cover_art.attached?}
  validates :kind, presence: true
  validate :date_is_valid, :correct_cover_art_type

  def date_is_valid
    if !released_at.nil?
      begin
        released_at&.to_date
      rescue Date::Error
        errors.add(:released_at, :invalid)
      end
    end
  end

  private

  def correct_cover_art_type
    if cover_art.attached? && !cover_art.content_type.in?(%w(image/jpg image/png image/jpeg))
      errors.add(:cover_art, ": Invalid file type")
    end
  end
end
