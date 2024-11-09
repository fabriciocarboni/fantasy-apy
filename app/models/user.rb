class User < ApplicationRecord
  # Validations for user attributes
  validates :name, presence: true  # Ensures that each user has a name
  validates :email, presence: true  # Ensures that each user has an email
  validates :approved, inclusion: { in: [true, false] }  # Ensures that the approved attribute is a boolean

  # A user can create many posts
  has_many :posts, dependent: :destroy  # Deletes a user's posts if the user is deleted

  # A user can write many comments
  has_many :comments, dependent: :destroy  # Deletes a user's comments if the user is deleted

  # A user can send many messages
  has_many :sent_messages, class_name: 'Message', foreign_key: 'from_id', dependent: :destroy  # Defines a one-to-many relationship for messages sent by the user

  # A user can receive many messages
  has_many :received_messages, class_name: 'Message', foreign_key: 'to_id', dependent: :destroy  # Defines a one-to-many relationship for messages received by the user

  # New associations for follows

  # Active relationships where the user follows others
  has_many :active_follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy 
  # Establishes a link to the Follow model where the user is the follower

  # Passive relationships where the user is followed by others
  has_many :passive_follows, class_name: 'Follow', foreign_key: 'following_id', dependent: :destroy 
  # Establishes a link to the Follow model where the user is being followed

  # List of users that this user is following
  has_many :following, through: :active_follows, source: :following 
  # Uses the active_follows relation to find all users this user is following

  # List of users that follow this user
  has_many :followers, through: :passive_follows, source: :follower 
  # Uses the passive_follows relation to find all users that follow this user
end
