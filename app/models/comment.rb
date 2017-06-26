class Comment < ApplicationRecord

  validates :content, :author, :post, presence: true

  belongs_to :author, class_name: :User
  belongs_to :post
  belongs_to :parent_comment, foreign_key: :parent_comment_id, class_name: :Comment

  has_many :child_comments,
    class_name: :Comment,
    foreign_key: :parent_comment_id
end
