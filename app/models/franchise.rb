class Franchise < ActiveRecord::Base
  has_many :workorders
  belongs_to :locations
end
