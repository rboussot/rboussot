require 'open-uri'
require 'nokogiri'

movie = "comedie"
html_file = open("http://www.allocine.fr/recherche/?q=#{movie}")
html_doc = Nokogiri::HTML(html_file)

movie_links = []

# On cherche un élément précis en partant de ses parents
html_doc.search('.totalwidth .totalwidth a').each do |element|
  movie_links << element.attribute('href')
end

movies = []
movie_links[0..2].each do |link|
  movie {}
  movie[:url] = base_url + link
  html_file = open(movie[:url])
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.titlebar-title-lg').each do |title|
    movie[:title] = title.text.strip
  end
movies << movie
end
