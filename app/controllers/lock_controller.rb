class LockController < ApplicationController
  skip_before_action :authenticate_user!, only: [:legacy_authorize]
  @@CARD_ID_REGEX = /^[0-9a-f]{8}$/

  def legacy_authorize
    card_id_service = CardIdService.new(params)
    lock_service = LockService.new(params)
    if card_id_service.valid?
      card_id_service.save_as_last_seen
      if lock_service.authorized?
        return head :ok
      end
    end
    return head :forbidden
  end

  def last_card_id
    last_card_id = nil
    File.open('tmp/last_card_id.txt', 'r') do |f|
      last_card_id = f.gets
    end
    respond_to do |format|
      format.json { render json: { last_card_id: last_card_id }}
    end
  end
end
