class TrailsController < ApplicationController

    get '/trails' do
        if logged_in?
            @user = User.find_by_id(session[:user_id])
            @trails = Trail.all
            erb :'trails/trails'
        else
            redirect '/login'
        end
    end

    get '/trails/new' do
        if logged_in?
            @user = User.find_by_id(session[:user_id])
            erb :'trails/new'
        else
            redirect '/login'
        end
    end

    post '/trails' do
        # binding.pry
        @trail = Trail.create(params["trail"])
        @trails = Trail.all.each{|trail|trail.name}
        redirect '/trails'
    end

    get '/trails/:slug' do
        @trail = Trail.find_by_slug(params[:slug])
        erb :'trails/show'
    end

end
