if File.exists?(Rails.root.join('tmp', 'debug.txt'))
  require 'byebug/core'
  Byebug.wait_connection = true
  Byebug.start_server('localhost', ENV.fetch('BYEBUG_SERVER_PORT', 1048).to_i)
  File.delete(Rails.root.join('tmp', 'debug.txt'))
end
