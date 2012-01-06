# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    playlist_id 1
    user_id 1
    role "MyString"
  end
end
