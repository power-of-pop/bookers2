class Book < ApplicationRecord

  has_one_attached :imagebe
  belongs_to :user

end
