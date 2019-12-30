class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  validates :email, uniqueness: true, allow_nil: true
  validates :phone_number, uniqueness: true, allow_nil: false

end
