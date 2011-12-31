class Song < ActiveRecord::Base
  belongs_to :requester, :class_name => "User"
  belongs_to :playlist

  validates :title, :presence => true,
                    :length => {:maximum => 255},
                    :uniqueness => {:scope => [:artist, :playlist_id], :message => I18n.t("errors.messages.duplicate_song")}
  
  validates :artist, :presence => true,
                      :length => {:maximum => 255}

  validates_presence_of :requester
  validates_presence_of :playlist

end
