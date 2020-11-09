class Member < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable

	has_many :posts, -> { order('created_at DESC') }, dependent: :destroy
	has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post
	has_many :comments, dependent: :destroy

  has_many :relationships, foreign_key: 'member_id'
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :member

  attachment :profile_image, destroy: false

  validates :name, presence: true, uniqueness: true, length: {maximum: 20}
  validates :profile, {length: {maximum: 100}}

  def follow(other_member)
    unless self == other_member
      self.relationships.find_or_create_by(follow_id: other_member.id)
    end
  end

  def unfollow(other_member)
    relationship = self.relationships.find_by(follow_id: other_member.id)
    relationship.destroy if relationship
  end

  def following?(other_member)
    self.followings.include?(other_member)
  end


  def favorited_by?(post_id)
    favorites.where(post_id: post_id).exists?
  end

  def Member.search(search, post_or_member)
    if post_or_member == "2"
      Member.where(['name LIKE ?', "%#{search}%"])
    else
      Member.all
    end
  end

end
