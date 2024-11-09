class Comment < ApplicationRecord
    # Each comment belongs to a single post
    belongs_to :post  # The post that the comment is associated with
  
    # Each comment is authored by a single user
    belongs_to :user  # The user who wrote the comment
  end
