FactoryGirl.define do
  random = rand(10000)
  factory :user do
    username "Username#{random}"
    email {"#{username}@#{username}.com"}
    password "hello_world"
    password_confirmation "hello_world"
  end
end
