class App < Sinatra::Base
    get '/authorize' do
        if session[:user_id]
            @auth = Authorization.first(email: session[:user_id])
            erb :authorize
        else 
            redirect '/'
        end 
    end

    post '/authorize' do
        auth = Authorization.new(email: session[:user_id], hex_length: 32)
        if auth.save
            redirect '/authorize'
        else
            flash[:notice] = auth.errors.full_messages
        end
        redirect '/'
    end
end