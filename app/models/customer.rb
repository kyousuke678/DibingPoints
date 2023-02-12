class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :points
  has_many :favorites, dependent: :destroy
  has_many :point_comments, dependent: :destroy
  has_one_attached :profile_image
       
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
         
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
# ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.name = 'ゲスト'
      customer.password = SecureRandom.urlsafe_base64
    end
  end
end
