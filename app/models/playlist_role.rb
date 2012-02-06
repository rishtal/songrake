class PlaylistRole < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :user

  after_save :increase_counter

  ROLES = ["Creator", "Member"]

  validates :role, :presence => true, :inclusion => ROLES
  validates :user_id, :uniqueness => {:scope => [:playlist_id], :message => I18n.t("errors.messages.duplicate_role")}

  validates_presence_of :playlist
  validates_presence_of :user

  def self.join_playlist_as_member(playlist_id, user_id)
    PlaylistRole.new(:playlist_id => playlist_id, :user_id => user_id, :role => "Member")
  end

  def self.playlist_member_or_creator?(playlist_id, user_id)
    @roles = PlaylistRole.where(:playlist_id =>  playlist_id, :user_id => user_id)
    return @roles.size > 0
  end

  protected

  def increase_counter
    if playlist.member_count.nil? || playlist.member_count < 1
      playlist.member_count = 1
    else
      playlist.member_count += 1
    end
    playlist.save!
  end
end
