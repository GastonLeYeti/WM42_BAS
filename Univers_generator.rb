require 'json'

p "Lancement des réactueurs"
p "Génération imminente de l'univers"
p "Veuillez patienter..."

# Liste des types avec leur intro
types = [
  {
    id: 1,
    name: 'Science-fiction',
    intro: 'Explorez des mondes étranges, rencontrez des extraterrestres et combattez des ennemis technologiquement avancés.'
  },
  {
    id: 2,
    name: 'Fantaisie',
    intro: 'Découvrez des mondes enchantés, combattez des créatures mythiques et explorez des ruines antiques.'
  },
  {
    id: 3,
    name: 'Horreur',
    intro: 'Plongez dans un monde terrifiant où des forces surnaturelles menacent la survie de vos personnages.'
  },
  {
    id: 4,
    name: 'Western',
    intro: "Explorez les vastes étendues sauvages de l'Ouest américain, participez à des duels de pistoleros et sauvez les gens d'un village."
  },
  {
    id: 5,
    name: 'Post-apocalyptique',
    intro: 'Survivez dans un monde dévasté par une catastrophe, combattez des bandits et des mutants et cherchez des ressources pour survivre.'
  },
  {
    id: 6,
    name: 'Espionnage',
    intro: "Incarnez un agent secret dans une guerre d'espionnage et de contre-espionnage, et déjouez les complots de vos ennemis."
  },
  {
    id: 7,
    name: 'Historique',
    intro: 'Voyagez à travers le temps et explorez les époques passées, des combats médiévaux aux conflits de la Seconde Guerre mondiale.'
  },
  {
    id: 8,
    name: 'Piraterie',
    intro: 'Explorez les mers dangereuses des Caraïbes, combattez des navires ennemis et cherchez des trésors légendaires.'
  }
]

# Liste des noms avec leur intro et leur type
names = [
  {
    name: 'Post-apocalyptique',
    intro: "La fin du monde a eu lieu et la civilisation telle que nous la connaissions n'existe plus. Les personnages naviguent dans un monde dévasté et dangereux où la survie est la priorité.",
    type: '1'
  },
  {
    name: 'Aliens et extraterrestres',
    intro: 'Les personnages explorent des mondes extraterrestres et rencontrent des êtres étranges. Ils découvrent les cultures, les langues et les technologies de ces espèces étrangères.',
    type: '1'
  },
  {
    name: 'Exploration spatiale',
    intro: "Les personnages voyagent dans l'espace à la recherche de nouvelles planètes, de ressources et de connaissances. Ils explorent des mondes inconnus, affrontent des dangers et découvrent de nouveaux horizons.",
    type: '1'
  },
  {
    name: 'Futur dystopique',
    intro: "Dans un futur proche ou lointain, la société est sombre et oppressive. Les personnages luttent pour leur survie dans un monde corrompu et dangereux, où les gouvernements, les corporations et les forces de l'ordre sont des ennemis.",
    type: '1'
  },
  {
    name: 'Robots et androïdes',
    intro: 'Les personnages interagissent avec des machines intelligentes et des robots, qui peuvent être utiles, amicaux ou dangereux. Ils explorent la question de ce que signifie être humain dans un monde où les machines sont de plus en plus avancées.',
    type: '1'
  },
  {
    name: 'Voyage dans le temps',
    intro: "Les personnages voyagent dans le temps pour découvrir des événements passés ou futurs, pour changer l'histoire ou pour réparer les erreurs du passé.",
    type: '1'
  },
  {
    name: 'Cyberpunk',
    intro: "Dans un monde où la technologie a pris le dessus, les personnages luttent contre les grandes corporations qui contrôlent le monde et les cybercriminels qui s'opposent à elles. Ils naviguent dans un monde futuriste et dangereux où la technologie peut être une arme ou une bénédiction.",
    type: '1'
  },
  {
    name: 'Univers parallèles',
    intro: "Les personnages explorent des mondes alternatifs où les événements historiques ont pris un tournant différent, où les règles physiques ne sont pas les mêmes, ou où les civilisations extraterrestres ont évolué de manière différente.",
    type: '1'
  },
  {
    name: "Colonisation de planètes",
    intro: "Les personnages participent à la colonisation de nouveaux mondes, en construisant des infrastructures, en explorant de nouvelles régions et en établissant des relations avec les espèces autochtones.",
    type: '1'
  },
  {
    name: "Guerres intergalactiques",
    intro: "Les personnages sont impliqués dans des conflits armés à grande échelle entre différentes espèces extraterrestres ou entre différentes factions humaines dans l'espace.",
    type: '1'
  },
  {
    name: "Manipulation génétique",
    intro: "Les personnages sont confrontés à la manipulation génétique, soit en tant que sujets, soit en tant que scientifiques qui développent cette technologie. Ils explorent les questions éthiques et les implications de cette technologie avancée.",
    type: '1'
  },
  {
    name: "Récits de survie",
    intro: "Les personnages luttent pour survivre dans des environnements hostiles, tels que des déserts, des forêts, des montagnes ou des océans. Ils doivent trouver de la nourriture, de l'eau, des abris et des moyens de se protéger des dangers naturels et des animaux sauvages.",
    type: '1'
  },
  {
    name: "Mondes artificiels",
    intro: "explore des mondes créés par la main de l'homme ou d'autres espèces technologiquement avancées. Ces mondes peuvent être des stations spatiales, des colonies souterraines, des habitats orbitaux, des mégapoles futuristes, des mondes virtuels, et même des simulations de réalité.",
    type: '1'
  },
  {
    name: "Épées et sorcellerie",
    intro: "Plongez dans un monde fantastique rempli de créatures étranges et de magie. Incarnez un aventurier courageux, un puissant sorcier ou un guerrier intrépide dans une quête pour sauver le monde de la menace des ténèbres.",
    type: '2'
  },
  {
    name: "",
    intro: "",
    type: ''
  },
]

# Génération du JSON
data = { types: [], names: [] }

types.each do |type|
  data[:types] << { id: type[:id], name: type[:name], intro: type[:intro].gsub(/[\n\t]/, '') }
end

names.each do |name|
  type = data[:types].find { |t| t[:name] == name[:type] }
  data[:names] << { id: data[:names].size + 1, name: name[:name], intro: name[:intro].gsub(/[\n\t]/, ''), type_id: name[:type] }
end

json = JSON.generate(data)

p "json en cours de génération"


# Enregistrement du JSON dans un fichier
File.write('univers.json', json)

# faire patienter l'utilisateur avec une barre de progression
print "["
42.times do
  sleep 0.1
  print "#"
end
print "]"
puts " "
p "json généré"
