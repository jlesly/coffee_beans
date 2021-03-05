class EspressoController < ApplicationController

    get '/espresso' do 
        if Helpers.is_logged_in?(session)
            @user= Helpers.current_user(session)
            if @user !=nil
                @espresso = Espresso.where(:user_id => @user_id)
            end
        else
        redirect "/login"
        end 
        erb :'espresso/index'
    end 

    get '/espresso/new' do 
        if Helpers.is_logged_in?(session)
            erb :'espresso/new'
        else
        redirect "/login"
        end 
    end 

    post '/espresso' do
        user=Helpers.current_user(session)
        
        espresso= user.espresso.create(params)
        if espresso.save
            puts "Saved"
        else
            puts "Try again to save."
        end
    end 

    get '/espressso/:id' do
        if Helpers.is_logged_in?(session)
            @user= Helpers.current_user(session)
            @espresso= Espresso.find_by_id(params["id"])
            if @user.id == @espresso.user_id
                erb :'espresso/show'
            else
                redirect "/login"
            end
        else
            redirect "/login"
        end
    end

    get '/espresso/:id/edit' do
        if Helpers.is_logged_in?(session)
            @user=Helpers.current_user(session)
            @espresso=Espresso.find_by_id(params["id"])
            if @user.id == @espresso.user_id
                erb :'espresso/edit'
            else
                redirect '/login'
            end
        else
            redirect '/login'
        end 
    end 

end 
