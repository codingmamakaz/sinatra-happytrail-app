class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
          erb  :'/users/create_user'
        else
          redirect '/trails'
        end
    end

    post '/signup' do 
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
          redirect '/signup'
        else
          @user = User.new(params[:user])
          @user.save
          session[:user_id] = @user.id
          redirect to '/trails'
        end
      end

    get '/login' do 
        if !logged_in?          
          erb :'users/login'
        else	  
          redirect '/trails'	          
        end	       
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/trails'
        else
            redirect '/signup'
        end
    end

    get '/user/edit' do
      @user = User.find_by(:id => session[:user_id])
      erb :'users/edit'
    end

    get '/user' do
      @user = User.find_by(:id => session[:user_id])
      erb :'users/user'
    end

    patch '/user' do
      if params[:password] == ""
        redirect '/user/edit'
      end
      @user = User.find_by(:id => session[:user_id])
      @user.update(params[:user])
      @user.save
      redirect '/user'
    end

    get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
    end
    
end




