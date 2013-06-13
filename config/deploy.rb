require "bundler/capistrano"
set :bundle_flags, "--deployment --binstubs"

set :default_environment, {
    'PATH' => "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
}

# Server
set :application, "web"
set :deploy_to, "/home/nanofactory/#{application}"
set :user, "nanofactory"
set :use_sudo, false
set :domain, "88.86.123.227"
server domain, :app, :web
role :db, domain, :primary => true

# scm settings
set :repository, "git://github.com/papricek/nanofactory.git"
set :scm, "git"
set :scm_verbose, true
set :branch, "master"
set :keep_releases, 10
#set :deploy_via, :remote_cache

set :normalize_asset_timestamps, false

# Tasks
after :deploy do
  site.create_symlinks
  site.precompile_assets
  deploy.cleanup
  deploy.migrate
end

namespace :site do
  desc "Create or update symlinks "
  task :create_symlinks do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{deploy_to}/shared/db/production.sqlite3 #{release_path}/db/production.sqlite3"
  end

  desc "Precompile assets"
  task :precompile_assets do
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end
end

namespace :deploy do
  task :start do
  end
  task :stop do
  end
  task :restart, :roles => :app, :except => {:no_release => true} do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end
