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
    ["Gioachino Rossini", 1792, 1868, "Italy"],
    ["Georges Bizet", 1838, 1875, "France"],
    ["Claude-Michel Schonberg", 1944, nil, "France"],
    ["Mel Brooks", 1926, nil, "United States"],
    ["Richard Sherman", 1928, nil, "United States"],
    ["Alan Menken", 1949, nil, "United States"],
    ["Lin-Manuel Miranda", 1980, nil, "United States"],
    ["Andrew Lloyd Weber", 1948, nil, "England"],
    ["Bob Gaudio", 1942, nil, "United States"],
    ["Stephen Schwartz", 1948, nil, "United States"],
    ["Elton John", 1947, nil, "England"]
  ],
  :genre_keys =>
    ["name"],
  :genres => [
    ["Opera - Tragedy"],
    ["Opera - Comedy"],
    ["Opera"],
    ["Opera - Opera Comique"],
    ["Musical - Drama"],
    ["Musical - Comedy"],
    ["Musical - Hip Hop"],
    ["Musical"],
    ["Musical - Jukebox Musical"]
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
    ["Otello", 1816, 4, 3],
    ["Carmen", 1875, 5, 4],
    ["La traviata", 1853, 1, 3],
    ["La Bohème", 1896, 2, 3],
    ["Rigoletto", 1851, 1, 3],
    ["Tosca", 1900, 2, 3],
    ["Miss Saigon", 1991, 6, 5],
    ["The Producers", 2001, 7, 6],
    ["Mary Poppins", 2006, 8, 6],
    ["Alladin", 2014, 9, 6],
    ["Hamilton", 2015, 10, 7],
    ["Cats", 1981, 11, 8],
    ["Les Miserables", 1980, 6, 5],
    ["Beauty and the Beast", 1994, 9, 8],
    ["Jersey Boys", 2005, 12, 9],
    ["The Phantom of the Opera", 1986, 11, 8],
    ["Wicked", 2003, 13, 8],
    ["The Lion King", 1997, 14, 8]
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