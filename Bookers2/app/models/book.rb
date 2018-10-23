class Book < ApplicationRecord

	belongs_to :user

	validates :book_title, presence: true
	validates :book_body, length: { maximum: 200 }
	validates :book_body, presence: true

end
