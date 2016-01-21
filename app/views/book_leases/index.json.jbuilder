json.array!(@book_leases) do |book_lease|
  json.extract! book_lease, :id, :date_start, :date_end
  json.url book_lease_url(book_lease, format: :json)
end
