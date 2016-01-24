class BookKeepRecord < ActiveRecord::Base
  include BookKeepRecordsHelper
  belongs_to :book_keep_category
  belongs_to :user

  def show_val()
  	format_value(value)
  end
end
