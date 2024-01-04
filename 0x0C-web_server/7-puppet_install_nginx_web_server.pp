# NGINX server
exec {'update':
command => 'sudo apt-get update -y',
}

# installs nginx and ensures its running
package {'nginx':
  ensure => 'installed',
}
service {'nginx':
  ensure => 'running',
  enable => true,
}
# configure Nginx to be listening on port 80
exec {'Nginx_port_config':
  command => 'sudo ufw allow "Nginx HTTP"',
}

# configure Nginx server to return a page that contains the string Hello World!
file {'/var/www/html/index.html':
  ensure  => 'file',
  content => "Hello World!",
}
# echo "Hello World!" | sudo tee /var/www/html/index* > /dev/null

# configures redirect_me
exec {'permanent_redirect':
  command => "sudo sed -i '/listen 80 default_server;/ a\\n\t rewrite ^/ /var/www/html/index.html permanent;\n' /etc/nginx/sites-available/default,"
  notify  => Service['nginx'],

}
# create a custon 404 not found page
file {'/var/www/html/custom_404.html':
  ensure  => 'file',
  content => "Ceci n'est pas une page",
}
# echo "Ceci n'est pas une page" | sudo tee /var/www/html/custom_404.html > /dev/null

exec {'404_not_found':
  command => 'sudo sed -i "s/server {/server {\n    error_page 404 \/custom_404.html;/g" /etc/nginx/sites-available/default',
  notify  => Service['nginx'],
}

# reload Nginx configs
# sudo service nginx restart
