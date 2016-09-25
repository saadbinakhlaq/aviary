# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BIRD_NAMES = {
  "Crane": "Grus grus",
  "Coot": "Fulica atra",
  "Puffin": "Fratercula arctica",
  "Swallow": "Hirundo rustica",
  "Blackcap": "Sylvia atricapilla",
  "Raven": "Corvus corax",
  "Rook": "Corvus frugilegus",
  "Jay": "Garrulus glandarius",
  "Starling": "Sturnus vulgaris",
  "Bullfinch": "Pyrrhula pyrrhula"
}.freeze

CONTINENTS = ['Asia', 'Africa', 'North America', 'South America', 'Europe', 'Australia'].freeze

ADDED = ['2016-04-01', '2016-05-02', '2016-06-10'].freeze

def create_birds
  BIRD_NAMES.each do |common_name, scientific_name|
    Bird.create(name: common_name,
                family: scientific_name,
                continents: [CONTINENTS.sample],
                added: ADDED.sample,
                visible: [true, false].sample)
    puts "bird created : #{common_name}"
  end
  puts "DONE"
end

create_birds
