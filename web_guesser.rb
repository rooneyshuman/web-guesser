require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'

set :random_num, rand(1..100)

class App < Sinatra::Base
  get '/' do
    title = "Number Guesser"
    user_guess = params["guess"].to_i
    msg_color = :red
    message = check_guess(user_guess)
    erb :index, :locals => {
        :title => title, 
        :random_num => settings.random_num, 
        :message => message, 
        :msg_color => @msg_color}
  end

  def check_guess(user_guess)
    num = settings.random_num
    print("Random number: #{num} \n")
    if user_guess == 0
      ""
    elsif user_guess > num
      if user_guess >= num + 10
          @msg_color = "red"
          "Way too high!" 
      else
          @msg_color = "orange"
          "Too high!"
      end
    elsif user_guess < num
      if user_guess <= num - 10
          @msg_color = "red"
          "Way too low!"
      else
          @msg_color = "orange"
          "Too low!"
      end
    else
      @msg_color = "green"
      "You guessed correctly! The random number was " + num.to_s
    end
  end
  
  run!
end
