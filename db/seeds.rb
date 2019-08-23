puts 'Fetching ingredients from thecocktaildb.com'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = RestClient.get(url)
json = JSON.parse(response.body, symbolize_names: true)
ingredients = json[:drinks]

puts 'Creating ingredients'

ingredients.each do |ingredient|
  print '.'
  Ingredient.create!(name: ingredient[:strIngredient1])
end

print "\n"
puts 'Done'
