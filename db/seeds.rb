def ingredients_array(cocktail)

  ingredients = ""
  ingredient = cocktail["strIngredient1"]
  number = 1

  while !ingredient.nil? && ingredient != ""
    if ingredients == ""
      ingredients += ingredient
    else
      ingredients += ", " + ingredient
    end
    number += 1
    ingredient = cocktail["strIngredient#{number}"]
  end

  return ingredients

end


Cocktail.destroy_all

puts "destroyed all cocktails"

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]



alphabet.each do |letter|
  url = "https://www.thecocktaildb.com/api/json/v2/9973533/search.php?f=#{letter}"
  url = RestClient.get(url)
  @response = JSON.parse(url)
  cocktail_array = @response["drinks"]
  if cocktail_array != nil
    cocktail_array.each do |cocktail|
      name = cocktail["strDrink"]
      preparation = cocktail["strInstructions"]
      image = cocktail["strDrinkThumb"]
      ingredients = ingredients_array(cocktail)
      Cocktail.create(name: name, ingredients: ingredients, preparation: preparation, image: image)
      puts "created cocktail"
    end
  end
end
