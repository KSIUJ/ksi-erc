class PagesController < ApplicationController

  # GET /
  def index
    @member = Member.new
    @member.memberships.build
    @membership = Membership.new
  end
end
