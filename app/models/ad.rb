class Ad < ApplicationRecord
  validates :title, :body, :price, presence: true
  has_many_attached :images
  belongs_to :user
end
