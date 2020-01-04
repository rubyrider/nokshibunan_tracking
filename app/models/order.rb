class Order < ApplicationRecord
  belongs_to :tracking_status
  belongs_to :payment_method
  belongs_to :delivery_method
  belongs_to :user, optional: true
  has_many :notes, as: :noteable
  accepts_nested_attributes_for :notes

  enum payment_status: %i[unpaid partial_payment full_payment]
end
