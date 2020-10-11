class Post < ApplicationRecord

	belongs_to :member
	belongs_to :event
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy

	validates :date, presence: true
	validates :food, presence: true
	validates :content, presence: true

end
