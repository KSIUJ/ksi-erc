class BookKeepRecord < ActiveRecord::Base
  belongs_to :book_keep_category
  belongs_to :user
end
