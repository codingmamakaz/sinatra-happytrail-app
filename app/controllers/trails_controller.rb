class TrailsController < ApplicationController

    get '/trails' do
        redirect_if_not_logged_in   
        @user = current_user
        @trails = Trail.all
        erb :'trails/trails'
    end

    get '/trails/new' do
        redirect_if_not_logged_in
        @user = current_user
        erb :'trails/new'
    end

    post '/trails' do
        if params[:trail][:name] == "" || params[:trail][:length] == ""
            redirect :'/trails/new'
        end
        @trail = current_user.trails.create(params[:trail])
        @trails = current_user.trails.all.each{|trail|trail.name}
        @trail.category_ids = params[:categories]
        if params["category"]["name"] != "" 
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

    get '/trails/:slug/edit' do
        redirect_if_not_logged_in
        @trail = Trail.find_by_slug(params[:slug])
        if @trail && @trail.user == current_user
            erb :'trails/edit'
        else
            redirect to '/trails'
        end
    end

    patch '/trails/:slug' do
        redirect_if_not_logged_in
        @trail = Trail.find_by_slug(params[:slug])
        @trail.update(params[:trail])
        @trail.category_ids = params["categories"]

        if params["category"]["name"] != "" 
            obj = Category.find_by(name: params[:category][:name]) || Category.create(name: params[:category][:name])
            @trail.categories << obj
        end
        @trail.save
        redirect ("/trails/#{@trail.slug}")
    end

    delete '/trails/:slug/delete' do
        redirect_if_not_logged_in
        @trail = Trail.find_by_slug(params[:slug])
        if @trail && @trail.user == current_user
            @trail.delete
        end
        redirect to '/trails'
    end
end
