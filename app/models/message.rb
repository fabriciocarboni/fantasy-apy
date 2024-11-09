class Message < ApplicationRecord
    # Association with the user who sends the message
    belongs_to :sender, class_name: 'User', foreign_key: 'from_id'
  
    # Association with the user who receives the message
    belongs_to :recipient, class_name: 'User', foreign_key: 'to_id'
  end
