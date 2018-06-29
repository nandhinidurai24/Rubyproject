# Common opts
shared_path = '/home/app/gustazos-go/current'
app_path = '/home/app/gustazos-go/current'
worker_processes 2
preload_app true
timeout 600

# Not using a socket because Ubuntu likes to reset connections
# Need to figure out why this is
# Could also listen on '127.0.0.1:8080' to be more explicit, security groups protect it though
listen 8080, tcp_nopush: true

# Set the user
user 'app'

# Fill working dir
working_directory app_path

# Log everything
stderr_path "#{shared_path}/log/unicorn.log"
stdout_path "#{shared_path}/log/unicorn.log"

# PID location
pid "#{shared_path}/tmp/pids/unicorn.pid"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

before_fork do |server, worker|
  # ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?( old_pid ) && server.pid != old_pid
    begin
      Process.kill( 'QUIT', File.read( old_pid ).to_i )
    rescue Errno::ENOENT, Errno::ESRCH
      # Someone else beat us to it
    end
  end
end

after_fork do |server, worker|
  # ActiveRecord::Base.establish_connection
end