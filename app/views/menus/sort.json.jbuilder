json.recipe @recipe do |recipe|
    json.id recipe.id
    json.cooking_name recipe.cooking_name
    json.ingredient recipe.ingredient
    json.process recipe.process
    json.image url_for(recipe.image)
end