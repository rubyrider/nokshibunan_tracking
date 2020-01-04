class User < ApplicationRecord
  has_many :notes, as: :noteable
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable,
         :validatable, password_length: 4..4
  devise :database_authenticatable, :authentication_keys => [:phone_number]

  extend FriendlyId

  friendly_id :full_name, use: :slugged

  mount_uploader :image, AvatarUploader

  validates_plausible_phone :phone_number
  phony_normalize :phone_number, country_code: :country_code, normalize_when_valid: true

  validates :email, uniqueness: true, allow_nil: true
  validates_presence_of :phone_number, uniqueness: true, allow_nil: false
  validates_format_of :password,  with: /\A\d+\z/, message: 'Only numbers are allowed.', allow_blank: true

  enum sex: %i[male female other]

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end

  def should_generate_new_friendly_id?
    slug.blank? || full_name_changed?
  end
end
