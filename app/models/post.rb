class Post < ApplicationRecord

  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :content, presence: true, length: { maximum: 140 }


end
