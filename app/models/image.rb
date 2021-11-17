class Image < ApplicationRecord
  validates :email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
  validates :image_file, presence: true
end
