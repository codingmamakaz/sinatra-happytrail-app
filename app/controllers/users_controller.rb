class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
          erb  :'/users/create_user'
        else
          redirect '/trails'
        end
        erb  :'/users/create_user'
    end


    
end


#work on sign up form
#work on post "/signup"
#don't forget to add 'use UsersController' in config.ru