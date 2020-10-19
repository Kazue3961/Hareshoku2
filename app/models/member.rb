class Member < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable

	has_many :posts, dependent: :destroy
	has_many :favorites, through: :favorites
	has_many :comments, dependent: :destroy

  attachment :profile_image, destroy: false

  validates :name, presence: true

  def Member.search(search, post_or_member)
    if post_or_member == "2"
      Member.where(['name LIKE ?', "%#{search}%"])
    else
      Member.all
    end
  end

end
