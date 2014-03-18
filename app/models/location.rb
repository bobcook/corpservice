class Location < ActiveRecord::Base
  belongs_to :client, :dependent => :destroy
  has_many :franchises
  has_many :workorders, :through => :franchises
end
