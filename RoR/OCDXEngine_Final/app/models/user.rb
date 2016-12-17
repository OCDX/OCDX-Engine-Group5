class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts,      dependent: :destroy
  #has_many :authors, :through => :posts
  accepts_nested_attributes_for :posts, allow_destroy: true

  def self.search(search)
    if search
      where("first_name iLIKE ?", "%#{search}%")
    end
  end
 
end
