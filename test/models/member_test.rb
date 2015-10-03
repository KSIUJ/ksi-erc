# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  name       :string
#  surname    :string
#  email      :string
#  card_id    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
