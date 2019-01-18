class TrailsController < ApplicationController

    get '/trails' do
        if logged_in?
            erb :'trails/trails'
        else
            redirect '/login'
        end
    end

end
