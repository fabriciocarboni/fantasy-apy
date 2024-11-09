class Post < ApplicationRecord
    # Each post is created by a single user
    belongs_to :user  # User is the author of the post
  
    # Each post can have many comments associated with it
    has_many :comments, dependent: :destroy
  end
