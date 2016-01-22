# == Schema Information
#
# Table name: books
#
#  id                  :integer          not null, primary key
#  title               :string
#  year                :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  publishing_house_id :integer
#  author_id           :integer
#

class Book < ActiveRecord::Base
	belongs_to :author
	belongs_to :publishing_house
	has_one :book_lease

	def full_name
    	(author==nil ? '' : author.name) + ' - ' + title  + '(' + (publishing_house==nil ? '' : publishing_house.name) + ',' + year.to_s + ')'
  	end
end
