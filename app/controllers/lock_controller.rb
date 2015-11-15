class LockController < ApplicationController
  skip_before_action :require_login
  @@CARD_ID_REGEX = /^[0-9a-f]{8}$/

  def authorize
    card_id = params[:card_id]
    if @@CARD_ID_REGEX.match(card_id)
      File.open('tmp/last_card_id.txt', 'w') do |f|
        f.puts card_id
      end
      @member = Member.where("card_id = ?", card_id)
      if @member.any?
        return head :ok
      end
    end
    return head :forbidden
  end
end
