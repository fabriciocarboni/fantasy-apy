class Follow < ApplicationRecord
    # Associations to link followers and following to the User model
    belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
    belongs_to :following, class_name: 'User', foreign_key: 'following_id'
  end
