class Post < ApplicationRecord

  belongs_to :user

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :content, presence: true, length: { maximum: 140 }


end
