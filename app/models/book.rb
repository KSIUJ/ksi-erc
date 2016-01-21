# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
	has_one :Author
	has_one :PublishingHause

end
