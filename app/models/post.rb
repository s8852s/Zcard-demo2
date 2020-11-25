class Post < ApplicationRecord
  # validates :title, presence: true, length: { minimum: 4 }
  # validates :content, prasence: true, length: { minimum: 6 }
  belongs_to :board
  belongs_to :user
end
