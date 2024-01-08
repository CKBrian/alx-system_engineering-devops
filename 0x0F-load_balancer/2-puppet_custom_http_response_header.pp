# Update packages
exec { 'update':
  command => 'apt update -y',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

# Install NGINX and ensure it's running
package { 'nginx':
  ensure => 'installed',
}

service { 'nginx':
  ensure => 'running',
  enable => true,
}
# Add Custom HTTP Response Header
file_line { 'http_header':
  path  => '/etc/nginx/nginx.conf',
  match => 'http {;',
  line  => "http {\n\tadd_header X-Served-By $HOSTNAME;",
}

# Reload NGINX to apply the changes
exec { 'nginx_reload':
  command => 'service nginx restart',
  require => File['/etc/nginx/sites-available/default'],
}
