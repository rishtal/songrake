
class Playlist < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_and_belongs_to_many :members, :class_name => "User"
  has_many :songs

  LIST_TYPE = ["Listed", "Unlisted"]

  validates :name, :presence => true,
                    :length => { :maximum => 100}
  
  validates :description, :length => {:maximum => 1000}

  validates :playlist_type, :inclusion => LIST_TYPE

  validates_presence_of :creator

end
