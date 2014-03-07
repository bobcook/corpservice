class Workorder < ActiveRecord::Base
  belongs_to :franchises, touch: true
  belongs_to :locations, touch: true
  validates_presence_of :locations_id
  validates_presence_of :franchises_id
end
