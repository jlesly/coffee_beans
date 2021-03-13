class EspressoController < ApplicationController

    get '/espresso' do 
        if Helpers.is_logged_in?(session)
            @user= Helpers.current_user(session)
            if @user !=nil
                @espressos = Espresso.where(:user_id => @user_id)
            end
        else
            flash[:error] = "Please login to view the page."
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
            flash[:notice] = "Entry saved!"
            redirect "/espresso"
        else
            flash[:error]= "Try again to save."
            redirect "/espresso/new"
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

    patch '/espresso/:id' do
        @user=Helpers.current_user(session)
        @espresso=Espresso.find_by_id(params["id"])

        if @user.id == @espresso.user_id
            @espresso.update(params["espresso"])
            flash[:notice] = "Succcessfully updated entry."
            redirect "/espresso/#{@espresso.id}"
        else
            redirect "/login"
        end
    end 

    delete '/espresso/:id' do
        @user=Helpers.current_user(session)
        @espresso=Espresso.find_by_id(params["id"])

        if @user.id == @espresso.user_id
            @espresso.destroy
            flash[:notice] = "Entry was deleted successfully."
            redirect "/espresso"
        else
            redirect "/login"
        end 
    end 
end 
