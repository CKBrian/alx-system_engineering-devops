# creates `.ssh` directory if not exists
# exec { 'ssh_directory' =>
#  command => '/usr/bin/mkdir -p ~/.ssh',
#}
# configures SSH client to use the private key ~/.ssh/school and refuse to authenticate using a password
#file {'~/.ssh/ssh_config':
#  ensure  => 'present',
#  mode    => '0600',
#  content => @("SSH_CONFIG")
#    Host dev
#      HostName 54.197.44.18
#      User ubuntu
#      IdentityFile '~/.ssh/school'
#      PasswordAuthentication no
#    SSH_CONFIG
#}
file_line {'turn off passwd auth':
  path => '~/.ssh/ssh_config'
  line => 'PasswordAuthentication no'
}

file_line {'Identity file':
  path => '~/.ssh/ssh_config'
  line => IdentityFile '~/.ssh/school'
}
