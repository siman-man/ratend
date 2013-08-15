class Event < ActiveRecord::Base
	belongs_to :user
	has_many :participates, dependent: :destroy
	validates :name, presence: true
	validates :content, presence: true
	validates :start_at, presence: true
	validates :end_at, presence: true

  has_event_calendar

  def members
  	User.find(participates.map(&:user_id))
  end
end
