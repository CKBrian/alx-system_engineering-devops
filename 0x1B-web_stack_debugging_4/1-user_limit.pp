# configure file limit(hard) for Holberton user.
exec { 'holberton-user-hard-file-limit':
  command => 'sed -i "/holberton hard/s/5/5000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}

# configure file limit(soft) for Holberton user.
exec { 'holberton-user-soft-file-limit':
  command => 'sed -i "/holberton soft/s/4/4000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}
