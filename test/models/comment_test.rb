# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  text          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  membership_id :integer
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:comment)
  end
  
  test '#membership' do
    assert @comment.membership
  end
end

