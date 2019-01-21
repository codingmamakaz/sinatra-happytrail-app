class TrailsController < ApplicationController

    get '/trails' do
        redirect_if_not_logged_in
        
        @user = User.find_by_id(session[:user_id])
        @trails = Trail.all
        erb :'trails/trails'
    end

    get '/trails/new' do
        redirect_if_not_logged_in
        @user = User.find_by_id(session[:user_id])
        erb :'trails/new'
    end

    post '/trails' do
        @trail = Trail.create(params[:trail])
        @trails = Trail.all.each{|trail|trail.name}
        @trail.category_ids = params[:categories]
        if params["category"]["name"] != nil 
            obj = Category.find_by(name: params[:category][:name]) || Category.create(name: params[:category][:name])
            @trail.categories << obj
        end
        @trail.save
        redirect '/trails'
    end

    get '/trails/:slug' do
        redirect_if_not_logged_in
        @trail = Trail.find_by_slug(params[:slug])
        erb :'trails/show'     
    end

end
