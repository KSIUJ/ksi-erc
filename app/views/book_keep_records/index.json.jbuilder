json.array!(@book_keep_records) do |book_keep_record|
  json.extract! book_keep_record, :id, :name, :BookKeepCategory_id, :date, :value, :User_id
  json.url book_keep_record_url(book_keep_record, format: :json)
end
