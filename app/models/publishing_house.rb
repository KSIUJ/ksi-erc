# == Schema Information
#
# Table name: publishing_houses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PublishingHouse < ActiveRecord::Base
	has_many :Books
end
