class UsersController < ApplicationController

    get '/signup' do
        # if !logged_in?
        #   erb  :'/users/create_user'
        # else
        #   redirect '/trails'
        # end
        erb  :'/users/create_user'
    end

    post '/signup' do 
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
          redirect to '/signup'
        else
          @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
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

    
end



#work on post "/signup"
