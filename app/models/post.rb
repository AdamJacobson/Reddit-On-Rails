class Post < ApplicationRecord

  validates :title, :author, presence: true
  validates :subs, length: { minimum: 1 }

  has_many :post_subs, inverse_of: :post
  has_many :subs, through: :post_subs

  # belongs_to :sub
  belongs_to :author, class_name: :User

end
