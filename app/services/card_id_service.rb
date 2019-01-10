class CardIdService
  @@CARD_ID_REGEX = /^[0-9a-f]{8}$/
  @@LAST_SEEN_CARD_PATH = 'tmp/last_card_id.txt'

  def initialzie(params)
    @card_id = params[:card_id]
  end

  def valid?
    if @@CARD_ID_REGEX.match(@card_id)
      return true
    end
    return false
  end

  def save_as_last_seen
    File.open(@@LAST_SEEN_CARD_PATH, 'w') do |f|
      f.puts @card_id
    end
  end
end
