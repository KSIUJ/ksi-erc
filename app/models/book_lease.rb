# == Schema Information
#
# Table name: book_leases
#
#  id         :integer          not null, primary key
#  date_start :datetime
#  date_end   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :integer
#

class BookLease < ActiveRecord::Base
	belongs_to :member
	belongs_to :book
end
