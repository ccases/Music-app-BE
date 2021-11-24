class Track < ApplicationRecord
  has_one_attached :audio_file
  validates :name, presence: true,
  format: { without: /\p{So}+/, message: "%{value} must not contain emojis😃"}
  # validates_format_of :audio_file, :with =>/\A\.(mp3|wav|ogg)$\z/, :message => "Audio file must be in .mp3, .wav, or .ogg", if: -> (x) {x.audio_file.attached?}
  # validates_attachment_content_type :audio_file, :content_type => ['audio/mp3', 'audio/ogg', 'audio/wav'], if: -> (x) {x.audio_file.attached?}
  validate :correct_audio_file_type
  
  private

  def correct_audio_file_type
    if audio_file.attached? && !audio_file.content_type.in?(%w(audio/mp3 audio/ogg audio/wav))
      errors.add(:audio_file, ": Invalid file type")
    end
  end

end
