require 'rubygems'
require 'sinatra'
require 'json'

set :environment, ENV['RACK_ENV'].to_sym
#disable :run, :reload

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/public/')
require '/home/timvdalen/webapps/hotc_api/api_app/public/api.rb'

run Sinatra::Application
