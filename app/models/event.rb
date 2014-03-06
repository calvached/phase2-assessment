class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :event_attendances
  has_many :attendees, through: :event_attendances
end

# User can create many events ^
# Events belong to one creator
# Users can attend many events
# Events can have many attendees
