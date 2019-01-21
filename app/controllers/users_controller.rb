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
          @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
          @user.save
          session[:user_id] = @user.id
          redirect to '/trails'
        end
      end

    get '/login' do 
        redirect_if_not_logged_in
        redirect '/trails'
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/trails"
        else
            redirect to '/signup'
        end
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




