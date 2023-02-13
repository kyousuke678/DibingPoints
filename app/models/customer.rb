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
  
  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
       
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  
  # フォローしたときの処理
  def follow(customer)
    relationships.create(followed_id: customer.id)
  end
  # フォローを外すときの処理
  def unfollow(customer)
    relationships.find_by(followed_id: customer.id).destroy
  end
  # フォローしているか判定
  def following?(customer)
    followings.include?(customer)
  end  
  
  
# ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.name = 'ゲスト'
      customer.password = SecureRandom.urlsafe_base64
    end
  end
end
