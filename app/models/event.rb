class Event < ActiveRecord::Base
  belongs_to :app

  validates :name, presence: true
  validates :app, presence: true

end
