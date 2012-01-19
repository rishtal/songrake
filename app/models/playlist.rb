
class Playlist < ActiveRecord::Base
  has_many :playlist_roles
  has_many :users, :through => :playlist_roles
  has_many :songs

  LIST_TYPE = ["Listed", "Unlisted"]

  validates :name, :presence => true,
                    :length => {:maximum => 100}
  
  validates :description, :length => {:maximum => 1000}

  validates :playlist_type, :inclusion => LIST_TYPE

  def creator
    creator_array = self.playlist_roles.where(:role => "Creator")
    if creator_array.size == 1
      return creator_array[0].user
    else
      return nil
    end
  end
end
