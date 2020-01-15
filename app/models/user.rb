# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  full_name              :string(255)
#  nickname               :string(255)
#  slug                   :string(255)
#  image                  :text(65535)
#  address                :string(255)
#  phone_number           :string(255)
#  emergency_contact      :string(255)
#  sex                    :integer
#  birth_date             :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  country_code           :string(255)
#

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
