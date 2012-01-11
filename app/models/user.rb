class User < ActiveRecord::Base
  acts_as_voter
  has_karma(:songs, :as => :requester, :weight => 1)

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role

  has_many :playlist_roles
  has_many :playlists, :through => :playlist_roles
  has_many :songs

  ROLE = ["User", "Admin"]

  validates :username, :uniqueness => true, :length => {:in => 5..20}
  validates :role, :presence => true, :inclusion => ROLE

end
