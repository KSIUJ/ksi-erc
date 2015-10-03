class Membership < ActiveRecord::Base
  belongs_to :member
  belongs_to :period
  has_one :comment
end
