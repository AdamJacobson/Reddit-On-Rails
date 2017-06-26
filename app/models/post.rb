class Post < ApplicationRecord

  validates :title, :author, presence: true
  validates :subs, length: { minimum: 1, message: "Must be posted in at least 1 sub" }

  has_many :post_subs, inverse_of: :post
  has_many :subs, through: :post_subs

  # belongs_to :sub
  belongs_to :author, class_name: :User

  has_many :comments

end
