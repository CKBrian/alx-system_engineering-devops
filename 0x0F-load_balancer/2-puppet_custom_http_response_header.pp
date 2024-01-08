# NGINX server

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

# Configure Nginx to listen on port 80
exec { 'Nginx_port_config':
  command => 'ufw allow "Nginx HTTP"',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

# Configure NGINX server
file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
  content => "
    server {
      listen 80 default_server;
      listen [::]:80 default_server;

      rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
      error_page 404 /custom_404.html;

      root /var/www/html;

      index index.html index.htm index.nginx-debian.html;

      server_name _;

      location / {
        try_files \$uri \$uri/ =404;
      }
    }
  ",
  notify  => Service['nginx'],
}

# Create a Hello World page
file { '/var/www/html/index.html':
  ensure  => 'file',
  content => 'Hello World!',
}

# Create a custom 404 page
file { '/var/www/html/custom_404.html':
  ensure  => 'file',
  content => "Ceci n'est pas une page",
}

file_line { 'http_header':
  path  => '/etc/nginx/sites-available/default',
  match => 'server_name _;',
  line  => "server_name _;\n\tadd_header X-Served-By \"${hostname}\";",
}
