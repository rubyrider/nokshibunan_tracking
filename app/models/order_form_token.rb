# == Schema Information
#
# Table name: order_form_tokens
#
#  id             :bigint           not null, primary key
#  order_id       :bigint
#  token          :text(65535)
#  expire_unit    :integer          default("minutes")
#  expire_at      :integer          default(30)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  last_access_at :datetime
#

class OrderFormToken < ApplicationRecord
  include Tokenable
  belongs_to :order

  enum expire_unit: %i[minutes hours months years]

  def is_valid_token
    return true unless self.accessed_at.present?
    available_time = self.expire_at.to_i.public_send(expire_unit.to_sym)

    self.accessed_at + available_time > Time.current
  end
end
