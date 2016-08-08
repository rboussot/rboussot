app.rb
require 'sinatra'
require_relative 'recipe'
require_relative 'cookbook'

CSV_FILE = File.join(File.dirname(__FILE__), 'recipes.csv')

get '/' do
  @recipes = Cookbook.new(CSV_FILE).recipes
  erb :index
end
