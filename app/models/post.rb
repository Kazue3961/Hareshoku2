class Post < ApplicationRecord

	belongs_to :member, optional: true
	belongs_to :event, optional: true
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy

  attachment :food_image, destroy: false

	validates :date, presence: true
	validates :food, presence: true
	validates :content, presence: true

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end

  def  commented_by?(member)
    comments.where(member_id: member.id).exists?
    end

end
