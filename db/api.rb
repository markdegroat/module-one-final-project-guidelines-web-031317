require_relative '../config/environment'

#MONKEY PATCHING WUT
class String
  def strip_ingredient_list
    #[2, 6, 13, 99, 27].any? { |i| [6, 13].include? i }
    #possibly use regex to combine this query
    self.split(/[\s,()]/).reject do |string|
      string.include?("tablespoon")  || string.include?("teaspoon") || string.include?("cup") || /\A\d+\z/.match(string) ||  string.include?("(") || string.include?(")") || string.include?(",") || string.include?("/") || string.include?("-")
    end.join(' ')
  end
end


SEARCH_TERMS = ["chicken", "eggs", "beef","pork", "carribean", "greek", "mexican", "italian", "vegetarian", "vegan"]
#https://api.edamam.com/search?q=chicken&app_id=${81a71c4e}&app_key=${52085f9209f9d0b19ee7a21fb9f0cdd6}
SEARCH_TERMS.each do |term|

  response = RestClient.get("https://api.edamam.com/search?q=#{term}&app_id=81a71c4e&app_key=52085f9209f9d0b19ee7a21fb9f0cdd6")
  data = JSON.parse(response)
  #binding.pry
  #puts "EOF"


  #data["hits"][0]["ingredients"]

  #ingredient list
  #data["hits"][0]["recipe"]["ingredients"]
  #individual ingredients
  #data["hits"][0]["recipe"]["ingredients"].collect{|ingredient| ingredient["text"]}
  #recipe title
  #data["hits"][0]["recipe"]["label"]


  #filling db with data
  data["hits"].each do |hit|

    r = Recipe.find_or_create_by(title: hit["recipe"]["label"])

    hit["recipe"]["ingredients"].each do |ingredient|
      ingredient = Ingredient.where("name LIKE ?", "%#{ingredient["text"].strip_ingredient_list}%").first
      if !!ingredient
        r.ingredients << ingredient
        r.save
      else
        r.ingredients.build(name: ingredient["text"].strip_ingredient_list)
      end
    end
    r.save
  end#end of data["hits"].each
end#end of SEARCH_TERMS.each



binding.pry
puts "EOF"






#filling a sample array to test our regex to extract ingredient names
# sample_array = []
# data["hits"].each do |hit|
#
#   sample_array += hit["recipe"]["ingredients"].collect{|ingredient| ingredient["text"]}
# end
# puts sample_array
# binding.pry
# puts "EOF"
#
# single_test = sample_array[1].split(/[\s,()]/)
# single_test = single_test.reject do |string|
#   string.include?("tablespoon")  || /\A\d+\z/.match(string) ||  string.include?("(") || string.include?(")") || string.include?(",")
# end
#
# puts sample_array.collect{|ingredient_list| ingredient_list.strip_ingredient_list}
