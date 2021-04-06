# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }
  validate :verify_file_type

  has_one_attached :user_icon

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  private

  def verify_file_type
    return unless user_icon.attached?

    allowed_file_types = %w[image/jpg image/jpeg image/gif image/png]
    errors.add(:user_icon, :invalid_file_type, allowed: 'jpg, jpeg, gif, png') unless allowed_file_types.include?(user_icon.blob.content_type)
  end
end
