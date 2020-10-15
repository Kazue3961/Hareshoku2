class Event < ApplicationRecord

	belongs_to :season
	has_many :posts, dependent: :destroy

  attachment :event_image, destroy: false

	# validates :date, presence: true
	validates :name, presence: true
	validates :food, presence: true
	validates :introduction, presence: true

end
