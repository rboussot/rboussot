require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class Scraper
  def parse(ingredient)
    url = "http://www.epicurious.com/search?terms=#{ingredient}"
    file = open(url)
    doc = Nokogiri::HTML(file)
    doc.search('.result').each do |result|
      name = result.search('.hed').inner_text
      result.search('.view-complete-item').attribute('href')
      unless name.blank?
        recipe_attributes[:name] = name
      end
      recipes << Recipe.new(recipe_attributes)
    end
    return recipes # array of recipes
  end
end

scraper = Scraper
scraper.parse("strawberry")
