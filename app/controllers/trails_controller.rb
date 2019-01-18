class TrailsController < ApplicationController

    get '/trails' do
        if logged_in?
            @user = User.find_by_id(session[:user_id])
            erb :'trails/trails'
        else
            redirect '/login'
        end
    end

end
