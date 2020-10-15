class Member < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable

	has_many :posts, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy

  attachment :profile_image, destroy: false

  validates :name, presence: true

  def active_for_authentication?
    super && (self.is_active == true)
  end

end
