# deployed_branch = Bundler.settings.credentials_for('deployed_branch').to_s
# config valid for current version and patch releases of Capistrano
lock '~> 3.10.0'

set :application, 'nokshibunan_tracking'
set :repo_url, 'git@github.com:rubyrider/nokshibunan_tracking.git'
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, File.read('.ruby-version').strip
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/master.key')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :assets_roles, %i[web app]
set :keep_releases, 2
set :pty,             true
set :use_sudo,        false
set :deploy_via,      :remote_cache
set :puma_bind, "unix://#{shared_path}/tmp/sockets/nokshibunan-tracking-puma.sock"

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
