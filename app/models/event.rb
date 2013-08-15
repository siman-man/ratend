class Event < ActiveRecord::Base
	belongs_to :user
	has_many :participates, dependent: :destroy
	validates :name, presence: true
	validates :content, presence: true

  has_event_calendar
end
