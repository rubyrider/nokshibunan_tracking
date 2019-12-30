class Order < ApplicationRecord
  belongs_to :tracking_status
  belongs_to :payment_method
end
