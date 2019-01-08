class LockController < ApplicationController
  skip_before_action :authenticate_user!, only: [:authorize, :legacy_authorize], raise: false
  @@CARD_ID_REGEX = /^[0-9a-f]{8}$/

  def authorize
    card_id = params[:card_id]
    lock_name = params[:lock_name]
    puts Rails.configuration.locks.known[lock_name]  
  end

  # todo delete this when ksi-lock code is finally fixed
  def legacy_authorize
    card_id = params[:card_id]
    if @@CARD_ID_REGEX.match(card_id)
      File.open('tmp/last_card_id.txt', 'w') do |f|
        f.puts card_id
      end
      @member = Member.find_by card_id: card_id
      if !@member.nil?
        return head :ok
      end
    end
    return head :forbidden
  end
end
