require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?
require_relative './models/mixtape.rb'
require_relative './controllers/mixtape_controller.rb'

use Rack::Reloader 

use Rack::MethodOverride

run MixtapeController