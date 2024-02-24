# Increases U-LIMIT in nginx configuration to allow handling of 1000 requests
exec { 'U-limit':
  command => 'sudo sed -i s/15/4096/ /etc/default/nginx && sudo service nginx restart',
  path    => ['/usr/bin', '/usr/sbin'],
}
