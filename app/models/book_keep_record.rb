class BookKeepRecord < ActiveRecord::Base
  belongs_to :BookKeepCategory
  belongs_to :User
end
