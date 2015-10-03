json.array!(@periods) do |period|
  json.extract! period, :id, :from, :to, :fee
  json.url period_url(period, format: :json)
end
