# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'factory_girl'

@user_djwronger = FactoryGirl.create(:user, :username => "djwronger", :email => "djwronger@songrake.com")

@user_jane = FactoryGirl.create(:user, :username => "Jane Tan", :email => "janetan@songrake.com")
@user_mike = FactoryGirl.create(:user, :username => "Michael", :email => "michael@songrake.com")
@user_taylor =FactoryGirl.create(:user, :username => "Taylor", :email => "taylor@songrake.com")

@micronics_party = FactoryGirl.create(:playlist, :name => "Micronics Holiday Party")

FactoryGirl.create(:playlist_role, :playlist => @micronics_party, :user => @user_djwronger, :role => "Creator")
FactoryGirl.create(:playlist_role, :playlist => @micronics_party, :user => @user_jane)
FactoryGirl.create(:playlist_role, :playlist => @micronics_party, :user => @user_mike)
FactoryGirl.create(:playlist_role, :playlist => @micronics_party, :user => @user_taylor)

FactoryGirl.create(:song,
                   :title => "Can't touch this",
                   :artist => "MC Hammer",
                   :playlist => @micronics_party,
                   :requester => @user_jane)

FactoryGirl.create(:song,
                   :title => "You Da One",
                   :artist => "Rihanna",
                   :playlist => @micronics_party,
                   :requester => @user_mike)

FactoryGirl.create(:song,
                   :title => "Never going to give you up",
                   :artist => "Rick Astley",
                   :playlist => @micronics_party,
                   :requester => @user_taylor)

FactoryGirl.create(:song,
                   :title => "You Belong with me",
                   :artist => "Taylor Swift",
                   :playlist => @micronics_party,
                   :requester => @user_taylor)

FactoryGirl.create(:song,
                   :title => "Levels",
                   :artist => "AVICII",
                   :playlist => @micronics_party,
                   :requester => @user_djwronger)

FactoryGirl.create(:song,
                   :title => "Help",
                   :artist => "Beatles",
                   :playlist => @micronics_party,
                   :requester => @user_djwronger)