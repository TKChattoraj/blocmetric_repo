FactoryGirl.define do
  random = rand(10000)
  factory :app do
    name "Name_#{random}"
    url "http://myapp#{random}.com"
  end
end
