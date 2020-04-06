# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
  :composer_keys =>
    ["name", "birth_year", "death_year", "country"],
  :composers => [
    ["Giuseppe Verdi", 1813, 1901, "Italy"],
    ["Giacomo Puccini", 1858, 1924, "Italy"],
    ["Richard Wagner", 1813, 1883, "Germany"],
    ["Gioachino Rossini", 1792, 1868, "Italy"]
  ],
  :genre_keys =>
    ["name"],
  :genres => [
    ["Opera - Tragedy"],
    ["Opera - Comedy"],
    ["Opera"]
  ],
  :show_keys =>
   ["title", "first_performance_year", "composer_id", "genre_id"],
  :shows => [
    ["Don Carlo", 1867, 1, 1],
    ["Falstaff", 1893, 1, 2],
    ["La fanciulla del West", 1910, 2, 2],
    ["Madame Butterfly", 1904, 2, 3],
    ["Tristan und Isolde", 1865, 3, 1],
    ["Parsifal", 1882, 3, 3],
    ["Il barbiere di Siviglia", 1816, 4, 2],
    ["Otello", 1816, 4, 3]
  ]
}

def main
  make_genres
   make_composers
   make_shows
 end

def make_genres
  DATA[:genres].each do |genre|
    new_genre = Genre.new
    genre.each_with_index do |attribute, i|
      new_genre.send(DATA[:genre_keys][i]+"=", attribute)
    end
    new_genre.save
  end
end

def make_composers
  DATA[:composers].each do |composer|
    new_composer = Composer.new
    composer.each_with_index do |attribute, i|
      new_composer.send(DATA[:composer_keys][i]+"=", attribute)
    end
    new_composer.save
  end
end

def make_shows
  DATA[:shows].each do |show|
    new_show = Show.new
    show.each_with_index do |attribute, i|
      new_show.send(DATA[:show_keys][i]+"=", attribute)
    end
    new_show.save
  end
end

main