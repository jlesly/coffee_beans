class EspressosController < ApplicationController

get '/espressos' do 
    if logged_in?
        @espressos= current_user.espressos
        erb :'espressos/index'
    else
        redirect "/signup"
    end
end 

get '/espressos/new' do 
    if logged_in?
        erb :'espressos/new'
    else   
        redirect "/login"
    end
end 

post '/espressos' do
    if logged_in?
        @espresso=current_user.espressos.create(params)
        redirect "/espressos"
    else
        erb :'espressos/new'
    end
end 

get '/espressos/:id' do
    if logged_in?
        @espresso = Espresso.find_by(:id => params[:id])
        erb :'espressos/show'
    else
        redirect '/login'
    end
end

get '/espressos/:id/edit' do
    if logged_in?
        @espresso= Espresso.find_by(:id => params[:id])
        if current_user.id == @espresso.user_id
        erb :'espressos/edit'
        else
            redirect "/login"
        end
    end
end

patch '/espressos/:id' do
    if logged_in?
        @espresso = Espresso.find_by(:id => params[:id])
        @espresso.name = params[:name]
        if @espresso.save
        redirect "/espressos"
        else
            redirect "/espressos/#{@espresso.id}/edit"
        end
    end
end


delete '/espressos/:id' do
    if logged_in?
        @espresso= Espresso.find_by(:id => params[:id])
        if current_user.id = @espresso.user_id
            @espresso.delete
            redirect "/espressos"
        else
            redirect "/login"
        end
    end
end 

end