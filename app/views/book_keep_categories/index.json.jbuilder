json.array!(@book_keep_categories) do |book_keep_category|
  json.extract! book_keep_category, :id, :name
  json.url book_keep_category_url(book_keep_category, format: :json)
end
