# skip assets precompile if no assets were changed
# not needed if you use the sprockets gem (or https://github.com/ndbroadbent/turbo-sprockets-rails3)

set_default(:assets_dependencies) { %w(app/assets lib/assets vendor/assets Gemfile.lock ) } #config/routes.rb) }
set_default(:asset_env) { "RAILS_GROUP=assets" }

namespace :assets do
  desc <<-DESC
      Run the asset precompilation rake task. You can specify the full path
      to the rake executable by setting the rake variable. You can also
      specify additional environment variables to pass to rake via the
      asset_env variable. The defaults are:

        set :rake,      "rake"
        set :rails_env, "production"
        set :asset_env, "RAILS_GROUPS=assets"
        set :assets_dependencies, fetch(:assets_dependencies) + %w(config/locales/js)
  DESC
  task :precompile, :roles => :web, :except => { :no_release => true } do
    begin
      from = source.next_revision(current_revision) # <-- Fail here at first-time deploy
    rescue
      deploy_cold = true
    end
    if deploy_cold || capture("cd #{latest_release} && #{source.local.log(from)} #{assets_dependencies.join ' '} | wc -l").to_i > 0
      run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
    else
      logger.info "Skipping asset pre-compilation because there were no asset changes"
    end
  end

  desc 'Force assets compilation'
  task :force_precompilation, roles: :web, except: {no_release: true} do
    from = source.next_revision(current_revision)
    run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
  end
  after   'deploy:update_code', 'assets:precompile'
end