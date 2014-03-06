class User < ActiveRecord::Base
  has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :event_attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendances, source: :event

  validates :email, :presence => true, :uniqueness => true
  validates :email, format: { with: /\w*@\w*\.\w*/, message: "Incorrect Format" }

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

# User can create many events ^
# Events belong to one creator
# Users can attend many events
# Events can have many attendees
