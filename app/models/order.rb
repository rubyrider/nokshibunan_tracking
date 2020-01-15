# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id                      :bigint           not null, primary key
#  user_id                 :bigint
#  address                 :text(65535)
#  price                   :float(24)
#  currency                :string(255)
#  product_name            :string(255)
#  product_detail          :text(65535)
#  product_image           :text(65535)
#  order_date              :datetime
#  estimated_delivery_date :datetime
#  payment_status          :integer
#  payment_method_id       :bigint           not null
#  tracking_status_id      :bigint           not null
#  delivery_method_id      :bigint           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  paid_amount             :float(24)        default(0.0)
#  delivery_fee            :float(24)        default(0.0)
#

class Order < ApplicationRecord
  extend FriendlyId

  friendly_id :order_serial, use: :slugged

  belongs_to :tracking_status
  belongs_to :payment_method
  belongs_to :delivery_method
  belongs_to :user, optional: true
  has_one :order_form_token
  has_many :notes, as: :noteable
  accepts_nested_attributes_for :notes
  # accepts_nested_attributes_for :user

  enum payment_status: %i[unpaid partial_payment full_payment]

  def order_serial
    letters = ('A'..'Z').to_a
    digits = ('0'..'9').to_a
    all    = letters + digits
    serial = 'NBT' + all.sample(10).shuffle.join

    [
      serial,
      [serial, :id]
    ]
  end
end
