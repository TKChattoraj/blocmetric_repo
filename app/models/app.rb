class App < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true

  URL_REGEX = /\A((https?:\/\/(www.)?)|(www.))([\w]+\.)+[a-zA-Z]{2,3}\z/i
  validates :url,
            presence: true,
            uniqueness: {case_sensative: false},
            format: {with: URL_REGEX}
end
