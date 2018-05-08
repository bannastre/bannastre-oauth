class App < Sinatra::Base
    get '/register' do
        erb :register
    end

    post '/register' do
        @user = User.create(email: params[:email], password: params[:password])
        erb :register
    end
end 
