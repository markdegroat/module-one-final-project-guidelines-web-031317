#https://api.edamam.com/search?q=chicken&app_id=${81a71c4e}&app_key=${52085f9209f9d0b19ee7a21fb9f0cdd6}
require 'json'
require "rest-client"
require 'pry'
require 'pp'
response = RestClient.get('https://api.edamam.com/search?q=chicken&app_id=81a71c4e&app_key=52085f9209f9d0b19ee7a21fb9f0cdd6')
data = JSON.parse(response)
#binding.pry
puts "EOF"
class String
  def strip_ingredient_list

    self.split(/[\s,()]/).reject do |string|
      string.include?("tablespoon")  || string.include?("teaspoon") || string.include?("cup") || /\A\d+\z/.match(string) ||  string.include?("(") || string.include?(")") || string.include?(",") || string.include?("/") || string.include("-")
    end.join(' ')
  end
end

#data["hits"][0]["ingredients"]

#ingredient list
#data["hits"][0]["recipe"]["ingredients"]
#individual ingredients
#data["hits"][0]["recipe"]["ingredients"].collect{|ingredient| ingredient["text"]}
#recipe title
#data["hits"][0]["recipe"]["label"]


#filling a sample array to test our regex to extract ingredient names
sample_array = []
data["hits"].each do |hit|

  sample_array += hit["recipe"]["ingredients"].collect{|ingredient| ingredient["text"]}
end
puts sample_array
binding.pry
puts "EOF"

single_test = sample_array[1].split(/[\s,()]/)
single_test = single_test.reject do |string|
  string.include?("tablespoon")  || /\A\d+\z/.match(string) ||  string.include?("(") || string.include?(")") || string.include?(",")
end

puts sample_array.collect{|ingredient_list| ingredient_list.strip_ingredient_list}
