require 'sinatra'
require 'sinatra/reloader'

get '/' do
"The secret number is: " + @@random_num.to_s
 
end

@@random_num = rand(100)
