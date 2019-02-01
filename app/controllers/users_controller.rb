class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
          erb  :'/users/create_user'
        else
          redirect '/trails'
        end
    end

    post '/signup' do 
        if params[:user][:username] == "" || params[:user][:email] == "" || params[:user][:password] == ""
          flash[:errors] = "Please fill all the fields."
          redirect '/signup'
        elsif
          @userobj = User.find_by(:username => params[:user][:username])
          if @userobj != nil
          flash[:errors] = "The username is taken. Please pick another name"
          redirect '/signup'
          end
        else
          @user = User.new(params[:user])
          @user.save
          session[:user_id] = @user.id
          flash[:message] = "Welcome to Happy Trails, #{@user.username}!"
          redirect to '/trails'
        end
      end

    get '/login' do 
        if !logged_in?          
          erb :'users/login'
        else	  
          redirect '/trails'	          
        end	       
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:message] = "Welcome back, #{@user.username}!"
            redirect '/trails'
        else
            flash[:errors] = "Your credentials were invalid. Please sign up or try again."
            redirect '/login'
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
      if params[:user][:password] == ""
        flash[:errors] = "Please enter old or new password."
        redirect '/user/edit'
      end
      @user = User.find_by(:id => session[:user_id])
      @original_user_name = @user.username
      @new_user_name = params[:user][:username]

      if User.all.any?{|user|user.username == @new_user_name} && @original_user_name != @new_user_name
        flash[:errors] = "The name is taken. Please pick another name"
        redirect '/user/edit'
      end
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




