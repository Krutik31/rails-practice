class Book < ApplicationRecord
  belongs_to :author

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  
end
