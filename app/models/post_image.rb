class PostImage < ApplicationRecord
  belongs_to :post
  has_many :post_images, dependent: :destroy
end
