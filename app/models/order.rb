class Order < ApplicationRecord

  belongs_to :tracking_status
  belongs_to :payment_method
  belongs_to :delivery_method
  belongs_to :user, optional: true

  enum payment_status: %i[unpaid partial_payment full_payment]
end
