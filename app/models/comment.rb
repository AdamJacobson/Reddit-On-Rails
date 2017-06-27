class Comment < ApplicationRecord

  include Votable

  validates :content, :author, :post, presence: true

  belongs_to :author, class_name: :User
  belongs_to :post
end
