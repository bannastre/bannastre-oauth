ENV["RACK_ENV"] ||= "development"

require "sinatra/base"

class App < Sinatra::Base
    enable :sessions
    use Rack::MethodOverride

    get '/' do 
        erb :index
    end
end
