class Role < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :user

  PLAYLIST_ROLES = ["Creator", "Member"]

  validates :role, :presence => true, :inclusion => PLAYLIST_ROLES
  validates :user_id, :uniqueness => {:scope => [:playlist_id], :message => I18n.t("errors.messages.duplicate_role")}

  validates_presence_of :playlist
  validates_presence_of :user

  def self.join_playlist_as_member(playlist_id, user_id)
    Role.new(:playlist_id => playlist_id, :user_id => user_id, :role => "Member")
  end
end
