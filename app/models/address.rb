class Address < ApplicationRecord
  belongs_to :addressable, class_name: 'User', foreign_key: 'user_id'
end
