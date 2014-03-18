class Workorder < ActiveRecord::Base
  belongs_to :franchise, touch: true
end
