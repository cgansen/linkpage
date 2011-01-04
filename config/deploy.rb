set :application, "linkpage"
set :repository,  "git@github.com:cgansen/linkpage.git"
set :scm, :git

set :user, 'cgansen'
set :use_sudo, false

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/www/thir_d-rail_org/webroot/#{application}"
set :deploy_via, :copy
set :copy_strategy, :export

role :app, "thir.d-rail.org"
role :web, "thir.d-rail.org"
role :db,  "thir.d-rail.org", :primary => true

namespace :deploy do
  after 'deploy:update_code', 'deploy:copy_db_config'
  
  task :copy_db_config do
    run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
  
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end