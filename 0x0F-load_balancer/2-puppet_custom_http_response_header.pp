# Update packages
exec { 'update':
  command  => 'sudo apt-get update',
  provider => shell,
}
# Install NGINX and ensure it's running
-> package {'nginx':
  ensure => present,
}
# Configure Nginx so that its HTTP response contains a custom header with the name of the custom HTTP header as X-Served-By then server name
-> file_line { 'header line':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "	location / {
  add_header X-Served-By ${hostname};",
  match  => '^\tlocation / {',
}
# reloads Nginx configs
-> exec { 'restart service':
  command  => 'sudo service nginx restart',
  provider => shell,
}
