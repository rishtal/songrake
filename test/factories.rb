FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@songrake.com"}
    sequence(:username) {|n| "username#{n}"}
    password "myTestPassword"
    password_confirmation "myTestPassword"
    role "User"
  end

  factory :playlist do
    sequence(:name) {|n| "playlist#{n}"}
    playlist_type "Unlisted"
  end

  factory :song do
    sequence(:title) {|n| "title#{n}"}
    sequence(:artist) {|n| "artist#{n}"}
    association :playlist
    association :requester, :factory => :user
  end

  factory :playlist_role do
    association :playlist
    association :user
    role "Member"
  end
end