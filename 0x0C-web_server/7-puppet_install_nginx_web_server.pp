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
  content => 'Hello World!',
}

# create a custon 404 not found page
file {'/var/www/html/custom_404.html':
  ensure  => 'file',
  content => "Ceci n'est pas une page",
}
# configures redirect_me
file {'/etc/nginx/sites-available/default':
  ensure  => 'file',
  content => "
	server {
			listen 80 default_server;
			listen [::]:80 default_server;

			rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
			error_page 404 /custom_404.html;

			root /var/www/html;

			# Add index.php to the list if you are using PHP
			index index.html index.htm index.nginx-debian.html;

			server_name _;

			location / {
					# First attempt to serve request as file, then
					# as directory, then fall back to displaying a 404.
					try_files \$uri \$uri/ =404;
			}

	}
	  ",
  notify  => Service['nginx'],

}
#exec {'permanent_redirect':
#  command => "
#    sudo sed -i '/listen 80 default_server;/ a\\n\t rewrite ^/ /var/www/html/index.html permanent;\n' /etc/nginx/sites-available/default
#	",
#  notify  => Service['nginx'],
#}
# create a custon 404 not found page
#file {'/var/www/html/custom_404.html':
#  ensure  => 'file',
#  content => "Ceci n'est pas une page",
#}
# echo "Ceci n'est pas une page" | sudo tee /var/www/html/custom_404.html > /dev/null

#exec {'404_not_found':
#  command => 'sudo sed -i "s/server {/server {\n    error_page 404 \/custom_404.html;/g" /etc/nginx/sites-available/default',
#  notify  => Service['nginx'],
#}

# reload Nginx configs
# sudo service nginx restart
