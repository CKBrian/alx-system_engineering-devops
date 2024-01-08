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

# Add Custom HTTP Response Header and Reload NGINX to apply the changes
exec { 'nginx_reload':
  command  => '/bin/bash -c "apt-get -y install nginx; sed -i \'/server_name _;/a\\\n\tadd_header X-Served-By $HOSTNAME;/\' /etc/nginx/sites-available/default; service nginx restart"',
  provider => shell,
}

