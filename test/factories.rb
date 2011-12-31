FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@songrake.com"}
    password "myTestPassword"
    password_confirmation "myTestPassword"
  end

  factory :playlist do
    sequence(:name) {|n| "playlist#{n}"}
    playlist_type "Unlisted"
    association :creator, :factory => :user
  end

  factory :song do
    sequence(:title) {|n| "title#{n}"}
    sequence(:artist) {|n| "artist#{n}"}
    association :playlist
    association :requester, :factory => :user
  end
end