require 'sinatra'
require 'sinatra/reloader'

set :random_num, rand(1..100)

get '/' do
  title = "Number Guesser"
  user_guess = params["guess"].to_i
  message = check_guess(user_guess)
  erb :index, :locals => {:title => title, :random_num => settings.random_num, :message => message}
end

def check_guess(user_guess)
  num = settings.random_num
  print("Random number: #{num} \n")
  if user_guess == 0
    ""
  elsif user_guess > num
    if user_guess >= num + 10
      "Way too high!" 
    else
      "Too high!"
    end
  elsif user_guess < num
    if user_guess <= num - 10
      "Way too low!"
    else
      "Too low!"
    end
  else
    "You guessed correctly! The random number was " + num.to_s
  end
end