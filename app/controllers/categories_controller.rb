class CategoriesController < ApplicationController

    get '/categories' do
        @categories = Category.all
        erb :'categories/index'
    end

    # get '/categories/:slug' do
    #     @category = Category.find_by_slug(params[:slug])
    #     erb :'categories/show'
    # end
end
