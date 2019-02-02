require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

# run Sinatra::Application

use UsersController
use TrailsController
use CategoriesController
run ApplicationController

