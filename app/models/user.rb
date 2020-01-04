class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable,
         :validatable, password_length: 4..4
  devise :database_authenticatable, :authentication_keys => [:phone_number]

  extend FriendlyId

  friendly_id :full_name, use: :slugged

  mount_uploader :image, AvatarUploader

  validates :email, uniqueness: true, allow_nil: true
  validates_presence_of :phone_number, uniqueness: true, allow_nil: false
  validates_format_of :password,  with: /\A\d+\z/, message: 'Only numbers are allowed.'

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
end
