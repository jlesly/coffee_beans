class UsersController < ApplicationController


get '/signup' do
    erb :'users/signup'
end 

post '/signup' do
    if User.find_by(:email => params["email"])
        puts "Looks like there is already an account with that email address."
        redirect "/login"
    else
        user=User.new(params) 

        if user.save
            session[:user_id]= user.id
            redirect "/"
        else
            flash[:error] = "All fields must be filled in"
            redirect "/signup"
        end 
    end 
end 

get '/login' do 
    erb :'users/login'
end 

post '/login' do 
    @user=User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/espressos"
        else
            flash[:error] = "We could not find an account with that email and password"
            redirect "/signup"
        end
    end 
end 

get '/logout' do 
    session.clear
    redirect "/"
end      