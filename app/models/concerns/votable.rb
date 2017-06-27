module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def upvote
    puts "Upvoted #{self}"
    self.votes << Vote.new(value: 1)
  end

  def downvote
    puts "Downvoted #{self}"
    self.votes << Vote.new(value: -1)
  end

end
