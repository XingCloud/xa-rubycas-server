load 'deploy' if respond_to?(:namespace) # cap2 differentiator
require 'bundler/capistrano'
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'
