class UsersController < ApplicationController


get '/signup' do
    if logged_in?
        redirect "/espresso"
    else
        erb :'users/signup'
    end
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
    if logged_in?
        redirect "/espresso"
    else
        erb :'users/login'
    end
end 

post '/login' do 
    @user=User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/espresso"
        else
            flash[:error] = "We could not find an account with that email and password"
            redirect "/signup"
        end
    end 
end 

get '/logout' do 
    if logged_in?
        session.clear
        flash[:message] = "You have logged out."    
        redirect "/login"
    else
        redirect "/"
    end
end      