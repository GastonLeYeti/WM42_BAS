require 'json'

# Lecture du fichier JSON
file = File.read('univers.json')
data = JSON.parse(file)

# Recherche de l'élément avec l'ID 6
element = data['names'].find { |e| e['id'] == 9 }
type = data['types'][element['type_id'].to_i - 1]

# Affichage des informations de l'élément
# p element
# p element['type_id']
# p type[element['type_id']]
# p element
# p type

puts "Type : #{type['name']}"
puts "Type intro : #{type['intro']}"

puts "Nom : #{element['name']}"
puts "Intro : #{element['intro']}"
