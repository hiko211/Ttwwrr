server '52.196.33.255', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/kimihiko/.ssh/id_rsa'
