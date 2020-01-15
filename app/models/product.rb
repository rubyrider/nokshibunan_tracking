# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  image      :text(65535)
#  detail     :text(65535)
#  price      :float(24)
#  currency   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
end
