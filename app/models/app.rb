class App < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates :user, presence: true

#  Note this URL_REGEX allows for localhost:4000"
  URL_REGEX = /\A((https?:\/\/(www.)?)|(www.))((\w)+\.)+([a-zA-Z]{2,3})|(localhost:\d{4})\z/i
  validates :url,
            presence: true,
            uniqueness: {case_sensative: false},
            format: {with: URL_REGEX}
  validates :name, presence: true
end
