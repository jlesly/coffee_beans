class UsersController < ApplicationController


get '/signup' do
    erb :'users/signup'
end 

post '/signup' do
    @user = User.new(params)
    if @user.save
        session[:user_id]=@user.id
        redirect "/epressos"
    else
        erb :'users/signup'
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
            redirect "/signup"
        end
    end 
end 

get '/logout' do 
    session.clear
    redirect "/"
end      