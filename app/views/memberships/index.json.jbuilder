json.array!(@memberships) do |membership|
  json.extract! membership, :id, :fee_paid, :tshirt
  json.url membership_url(membership, format: :json)
end
