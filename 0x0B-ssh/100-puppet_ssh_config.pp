# creates `.ssh` directory if not exists
# exec { '.ssh_directory' =>
#  command => '/usr/bin/mkdir -p ~/.ssh && cd ~/.ssh',
# }

# configures SSH client to use the private key ~/.ssh/school and refuse to authenticate using a password
file {'~/.ssh/ssh_config':
  ensure  => 'file',
  mode    => '600',
  content => "
    Host dev
      HostName 54.197.44.18
	  User ubuntu
	  IdentityFile ~/.ssh/school
	  PasswordAuthentication no
	  ",
}
