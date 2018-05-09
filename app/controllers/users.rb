class App < Sinatra::Base
    get "/users/new" do
        erb :"users/new"
    end

    post "/users" do
        user = User.new(email: params[:email], password: params[:password])
        if user.save
            session[:user_id] = user.id
        else
            flash[:notice] = user.errors.full_messages
        end

        redirect "/"
    end
end 
