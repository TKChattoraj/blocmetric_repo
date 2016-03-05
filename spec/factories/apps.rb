FactoryGirl.define do
  random = rand(10000)
  factory :app do
    url "http://myapp#{random}.com"
  end
end
