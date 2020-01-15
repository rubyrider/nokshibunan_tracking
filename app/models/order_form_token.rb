class OrderFormToken < ApplicationRecord
  include Tokenable
  belongs_to :order

  enum expire_unit: %i[minutes hours months years]

end
