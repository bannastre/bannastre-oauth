ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require_relative 'data_mapper_config'

class App < Sinatra::Base
    enable :sessions
    use Rack::MethodOverride
    
    get '/' do 
        erb :index
    end
end

require_relative 'controllers/users'
