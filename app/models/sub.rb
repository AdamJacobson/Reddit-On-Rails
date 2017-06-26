class Sub < ApplicationRecord
  validates :title, :moderator, presence: true

  has_many :post_subs, inverse_of: :sub
  has_many :posts, through: :post_subs

  # has_many :posts
  belongs_to :moderator, class_name: :User
end
