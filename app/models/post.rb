class Post < ApplicationRecord
  validate :content, presence: true, length: {in:1..140}
end
