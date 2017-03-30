#https://api.edamam.com/search?q=chicken&app_id=${81a71c4e}&app_key=${52085f9209f9d0b19ee7a21fb9f0cdd6}
require 'json'
require "rest-client"
require 'pry'
response = RestClient.get('https://api.edamam.com/search?q=chicken&app_id=81a71c4e&app_key=52085f9209f9d0b19ee7a21fb9f0cdd6')
data = JSON.parse(response)
binding.pry
puts "EOF"

data["hits"][0]["ingredients"]

#ingredient list
data["hits"][0]["recipe"]["ingredients"]
#recipe title
data["hits"][0]["recipe"]["label"]
