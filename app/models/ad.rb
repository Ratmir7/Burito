class Ad < ApplicationRecord
  validates :title, :body, :price, presence: true
  has_one_attached :image
end
