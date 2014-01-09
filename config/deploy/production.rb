server '162.243.201.195', :web, :app, :queue, :memcache, :db, primary: true

# Or, for multi-server setups 
# role :web, "{ip}"
# role :app, "{ip1}", "{ip2}"
# role :queue, "{ip}"
# role :memcache, "{ip}"
# role :db, "{ip}", primary: true

set :rails_env, 'production'

set :unicorn_workers, 3 #usually number of cpus (per app server) + 1

set :branch, "master"