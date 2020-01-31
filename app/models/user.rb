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
  attr_accessor :login
  has_many :notes, as: :noteable
  has_many :orders
  rolify
  attr_writer :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable,
         :validatable, password_length: 4..4
  devise :database_authenticatable, authentication_keys: [:login]

  extend FriendlyId

  friendly_id :full_name, use: :slugged

  mount_uploader :image, AvatarUploader

  validates_plausible_phone :phone_number
  phony_normalize :phone_number, country_code: :country_code, normalize_when_valid: true
  validates :email, uniqueness: true, allow_nil: true
  validates_format_of :email, with: Constants::Regex::EMAIL_REGEX
  validates_presence_of :phone_number, uniqueness: true, allow_nil: true
  validates_format_of :password, with: /\A\d+\z/, message: 'Only numbers are allowed.', allow_blank: true

  enum sex: %i[male female other]

  def login
    @login || self.phone_number || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(['phone_number = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:phone_number) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end

  def should_generate_new_friendly_id?
    slug.blank? || full_name_changed?
  end

  protected

  # Attempt to find a user by it's email. If a record is found, send new
  # password instructions to it. If not user is found, returns a new user
  # with an email not found error.
  def self.send_reset_password_instructions(attributes = {})
    recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys,
                                                             attributes, :not_found)
    recoverable.send_reset_password_instructions if recoverable.persisted?

    recoverable
  end

  def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error = :invalid)
    (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }

    attributes = attributes.slice(*required_attributes)
    attributes.delete_if { |_key, value| value.blank? }

    if attributes.keys.size == required_attributes.size
      if attributes.key?(:login)
        login  = attributes.delete(:login)
        record = find_record(login)
      else
        record = where(attributes).first
      end
    end

    unless record
      record = new

      required_attributes.each do |key|
        value = attributes[key]
        record.send("#{key}=", value)
        record.errors.add(key, value.present? ? error : :blank)
      end
    end
    record
  end

  def self.find_record login
    where(['phone_number = :value OR email = :value', { value: login }]).first
  end
end
