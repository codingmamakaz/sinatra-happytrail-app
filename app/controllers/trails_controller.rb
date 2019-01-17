class TrailsController < ApplicationController

    get '/trails' do
        erb :'trails/trails'
    end

end