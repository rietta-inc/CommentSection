class Comment < ApplicationRecord
  auto_strip_attributes :author, :body
  validates :author, presence: true
end
