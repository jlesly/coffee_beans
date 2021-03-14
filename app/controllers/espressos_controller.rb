class EspressosController < ApplicationController

    get '/espressos' do 
        if Helpers.is_logged_in?(session)
            @user= Helpers.current_user(session)
            if @user !=nil
                @espressos = Espresso.where(:user_id => @user_id)
            end
        else
            redirect "/login"
        end 
            erb :'espressos/index'
    end 

    get '/espressos/new' do 
        if Helpers.is_logged_in?(session)
            erb :'espressos/new'
        else
            redirect "/login"
        end 
    end 

    post '/espressos' do
        user=Helpers.current_user(session)
        
        espresso= user.espressos.create(params)
        if espresso.save
            flash[:message] = "Entry saved!"
            redirect "/espressos/index"
        else
            flash[:error]= "Try again to save."
            redirect "/espressos/new"
        end
    end 

    get '/espresssos/:id' do
        if Helpers.is_logged_in?(session)
            @user= Helpers.current_user(session)
            @espresso= Espresso.find_by_id(params["id"])
            if @user.id == @espresso.user_id
                erb :'espressos/show'
            else
                redirect "/login"
            end
        else
            redirect "/login"
        end
    end

    get '/espressos/:id/edit' do
        if Helpers.is_logged_in?(session)
            @user=Helpers.current_user(session)
            @espresso=Espresso.find_by_id(params["id"])
            if @user.id == @espresso.user_id
                erb :'espressos/edit'
            else
                redirect '/login'
            end
        else
            redirect '/login'
        end 
    end 

    patch '/espressos/:id' do
        @user=Helpers.current_user(session)
        @espresso=Espresso.find_by_id(params["id"])

        if @user.id == @espresso.user_id
            @espresso.update(params["espresso"])
            flash[:message] = "Succcessfully updated entry."
            redirect "/espressos/#{@espresso.id}"
        else
            redirect "/login"
        end
    end 

    delete '/espressos/:id' do
        @user=Helpers.current_user(session)
        @espresso=Espresso.find_by_id(params["id"])

        if @user.id == @espresso.user_id
            @espresso.destroy
            flash[:message] = "Entry was deleted successfully."
            redirect "/espressos"
        else
            redirect "/login"
        end 
    end 
end 
