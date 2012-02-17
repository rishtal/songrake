class Song < ActiveRecord::Base
  acts_as_voteable

  belongs_to :requester, :class_name => "User"
  belongs_to :playlist

  after_save :update_playlist_song_count

  validates :title, :presence => true,
                    :length => {:maximum => 255},
                    :uniqueness => {:scope => [:artist, :playlist_id], :message => I18n.t("errors.messages.duplicate_song")}
  
  validates :artist, :presence => true,
                      :length => {:maximum => 255}

  validates_presence_of :requester
  validates_presence_of :playlist

  protected

  def update_playlist_song_count
    if self.playlist.song_count.nil?
      self.playlist.song_count = 1
    else
      self.playlist.song_count = self.playlist.song_count + 1
    end

    self.playlist.save!
  end
end
