class LockController < ApplicationController
  skip_before_action :authenticate_user!
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
end
