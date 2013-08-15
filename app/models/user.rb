class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  before_create :create_remember_token

  has_many :events, dependent: :destroy
  has_many :participates, dependent: :destroy

  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def attend!(event)
    participates.create(event_id: event.id)
  end

  def attend?(event)
    participates.find_by_event_id(event.id)
  end

  def abstention!(attend)
    participates.find_by_id(attend.id).destroy
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
