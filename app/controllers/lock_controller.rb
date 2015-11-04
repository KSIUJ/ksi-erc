class LockController < ApplicationController
  skip_before_action :require_login
  
  def authorize
    @member = Member.where("card_id = ?", params[:card_id])
    if @member.blank?
      head :forbidden
    else
      head :ok
    end
  end
end
