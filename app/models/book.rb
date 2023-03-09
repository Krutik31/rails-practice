class Book < ApplicationRecord
  belongs_to :author

  validates :name, presence: true
  validates :price, presence: true

  validate :validate_repeatancy, if: :check_record?

  private

  def validate_repeatancy
    self.errors.add(:price, "Data already exists.")
  end

  def check_record?
    @author = Author.find(self.author_id)
    (!(@author.books.where(name: self.name).where(price: self.price).empty?))
  end
  
end
