require 'sinatra'
require 'sinatra/reloader'

# Variables
random_num = rand(100)
title = "Number Guesser"

get '/' do
  erb :index, :locals => {:title => title, :random_num => random_num}
end