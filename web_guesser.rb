require 'sinatra'
require 'sinatra/reloader'

# Variables
random_num = rand(1..100)
title = "Number Guesser"

get '/' do
  user_guess = params["guess"].to_i
  message = check_guess(user_guess, random_num)
  erb :index, :locals => {:title => title, :random_num => random_num, :message => message}
end

def check_guess(user_guess, random_num)
  print("Random number: #{random_num} \n")
  if user_guess == 0
    ""
  elsif user_guess > random_num
    if user_guess >= random_num + 10
      "Way too high!" 
    else
      "Too high!"
    end
  elsif user_guess < random_num
    if user_guess <= random_num - 10
      "Way too low!"
    else
      "Too low!"
    end
  else
    "You guessed correctly! The random number was " + random_num.to_s
  end
end