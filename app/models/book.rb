class Book < ApplicationRecord

  belongs_to :user
  validates :title, presence: true
  validates :body, length: {maximum: 20 }, presence: true
end
