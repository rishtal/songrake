class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :playlist_id
      t.integer :user_id
      t.string :role

      t.timestamps
    end
  end
end
