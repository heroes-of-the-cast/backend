require 'rubygems'
require 'sinatra'
require 'json'
require 'yaml'
require 'mongo_mapper'

set :environment, :development
disable :run, :reload

db_config = YAML.load(File.new("../database.yml").read)
MongoMapper.setup(db_config, 'development')

$LOAD_PATH.unshift("/home/timvdalen/webapps/hotc_api/api_app/model/")

require './public/api.rb'

run Sinatra::Application
