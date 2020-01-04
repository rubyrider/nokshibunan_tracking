set :stage, :production
set :rails_env, :production
set :user, 'root'
set :branch, 'development'
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, '/home/apps/nokshibunan_tracking'

set :puma_conf, "#{shared_path}/config/puma.rb"

set :puma_bind, "unix://#{shared_path}/tmp/sockets/nokshibunan-tracking-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to true if using ActiveRecord

server '157.245.204.254', {user:        "root",
                           roles:       %w{web db app},
                           ssh_options: {
                               keys:          %w(~/.ssh/id_rsa),
                               forward_agent: true,
                               auth_methods:  %w(publickey)
                           }
}