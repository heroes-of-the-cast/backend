require 'rubygems'
require 'sinatra'
require 'json'
require 'yaml'
require 'mongo_mapper'

set :environment, ENV['RACK_ENV'].to_sym
disable :run, :reload

db_config = YAML.load(File.new("../database.yml").read)
MongoMapper.setup(db_config, 'development')

require './public/api.rb'

run Sinatra::Application
