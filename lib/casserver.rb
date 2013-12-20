module CASServer; end
require "rubygems"

gem "activerecord", "= 2.3.12"
gem "activesupport", "= 2.3.12"
#require_gem 'active_record', '2.3.12'
#require_gem 'active_support', '2.3.12'
require 'active_record'
require 'active_support'
require 'sinatra/base'
require 'builder' # for XML views
require 'logger'
$LOG = Logger.new(STDOUT)

require 'casserver/server'

