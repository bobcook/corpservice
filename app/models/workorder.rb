class Workorder < ActiveRecord::Base
  belongs_to :franchise, touch: true
  belongs_to :location, touch: true
  validates_presence_of :location_id
  validates_presence_of :franchise_id
end
