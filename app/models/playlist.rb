
class Playlist < ActiveRecord::Base
  has_many :playlist_roles
  has_many :users, :through => :playlist_roles
  has_many :songs, :order => "created_at DESC"

  LIST_TYPE = ["Listed", "Unlisted"]

  validates :name, :presence => true,
                    :length => {:maximum => 100}
  
  validates :description, :length => {:maximum => 500}

  validates :playlist_type, :inclusion => LIST_TYPE


  # Should Always create Playlists with this function
  # Throws exception if something fails. Catch ActiveRecord:InvalidRecord in
  # controller so that the validation errors propagate to the view
  # playlist_params: attributes to be added to playlist
  # creator: User instance of the playlist creator 
  def create_playlist!(playlist_params, creator)

    self.name = playlist_params[:name]
    self.description = playlist_params[:description]
    self.playlist_type = "Listed"

    Playlist.transaction do
      self.save!
      role = self.playlist_roles.build(:playlist_id => self.id,
                                       :user_id => creator.id,
                                       :role => "Creator")
      role.save!
    end
  end

  def creator
    creator_array = self.playlist_roles.where(:role => "Creator")
    if creator_array.size == 1
      creator_array[0].user
    else
      nil
    end
  end

end
