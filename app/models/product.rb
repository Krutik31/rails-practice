class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true
  validates :price, presence: true
  validates :brand, presence: true

  before_create :creatingmsg
  def creatingmsg
    puts "Message Before create command from 'before_create' callback."
  end

  after_create :createdmsg
  def createdmsg
    puts "Message after create command from 'after_create' callback."
  end

  after_commit :commitedmsg
  def commitedmsg
    puts "Message after successful commiting from 'after_commit' callback."
  end
end
