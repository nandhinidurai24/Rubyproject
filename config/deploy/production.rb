set :stage, :production
set :deploy_to, '/home/app/gustazos-go'
set :branch, 'new_server'

# App server array
app_servers = ['go-app-001', 'go-app-002']

# Example of app nodes

role :app, app_servers
role :web, app_servers