class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true
  validates :price, presence: true
  validates :brand, presence: true

  before_create :display_before_create_message
  after_create :display_after_create_message
  after_commit :display_after_commit_message

  def display_before_create_message
    puts "Message Before create command from 'before_create' callback."
  end

  def display_after_create_message
    puts "Message after create command from 'after_create' callback."
  end

  def display_after_commit_message
    puts "Message after successful commiting from 'after_commit' callback."
  end
end
