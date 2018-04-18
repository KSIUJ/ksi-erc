class LockController < ApplicationController
  skip_before_action :require_login
  @@CARD_ID_REGEX = /^[0-9a-f]{8}$/

  def authorize
    card_id = params[:card_id]
    if @@CARD_ID_REGEX.match(card_id)
      File.open('tmp/last_card_id.txt', 'w') do |f|
        f.puts card_id
      end
      @member = Member.find_by card_id: card_id
      if !@member.nil? && has_current(@member.memberships)
        return head :ok
      end
    end
    return head :forbidden
  end

  private
  def has_current(memberships)
    now = Time.now.to_date
    pivot = Time.new(now.year, 10, 31).to_date
    current_period = if now < pivot
      "#{pivot.year - 1}/#{pivot.year}"
    else
      "#{pivot.year}/#{pivot.year + 1}"
    end
    memberships.joins(:period).exists?(periods: { academic_year: current_period }, fee_paid: true)
  end
end
