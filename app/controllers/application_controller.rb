require './config/environment'
configure :development do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'kazumikarbowski', pool: 2}
end

configure :production do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'kazumikarbowski', pool: 2}
end

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_trail"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  
  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "Please login first."
        redirect "/login"
      end
    end

  end

end
