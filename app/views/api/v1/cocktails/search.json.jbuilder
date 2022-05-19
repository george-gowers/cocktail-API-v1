json.array! @cocktails do |cocktail|
  json.extract! cocktail, :id, :name, :ingredients, :preparation, :image
end
