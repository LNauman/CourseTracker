server '162.243.201.195', :web, :app, :queue, :memcache, :db, primary: true
set :rails_env, 'staging'
