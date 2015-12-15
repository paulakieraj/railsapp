json.array!(@cosmetics) do |cosmetic|
  json.extract! cosmetic, :id, :name, :picture, :description, :category_id
  json.url cosmetic_url(cosmetic, format: :json)
end
