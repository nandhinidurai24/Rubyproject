# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'gustitos-merchant-app'
set :repo_url, 'git@bitbucket.org:gustitos/gustitos-merchant-app.git'

# Default branch is :master
#set :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, -> { (`git rev-parse --abbrev-ref HEAD` || 'firebase_login').chomp }
# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('.env')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# set :ssh_options, { 
#   forward_agent: true, 
#   paranoid: true, 
#   keys: "~/.ssh/id_rsa" 
# }

# Default value for keep_releases is 5
set :keep_releases, 5

# RVM stuff
# set :rvm_type, :system
# set :rvm_ruby_version, '2.1.5'

# whenever settings
set :whenever_roles,        ->{ :app }
set :whenever_identifier,   ->{ "#{fetch(:application)}_#{fetch(:stage, 'production')}" }

namespace :deploy do
  desc 'Restart application in debug mode (tell Byebug remote debug server to start'
  task :restart_debug do
    on roles(:app), in: :groups, wait: 5 do

      execute :touch, release_path.join('tmp/debug.txt')
      invoke 'deploy:restart'
    end
  end

  desc 'Restart application (Passenger)'
  desc :restart do
    on roles(:app), in: :groups, wait: 5 do

      execute :rm, release_path.join('tmp/debug.txt') # clean possible previous debug session flag file
      invoke 'passenger:restart'
    end
  end
end
