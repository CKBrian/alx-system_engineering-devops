
# configures SSH client to refuse password authentication
file_line {'turn off password auth':
  path => '/etc/ssh/ssh_config',
  line => '  PasswordAuthentication no',
}

# configures SSH client to use the private key ~/.ssh/school
file_line {'Identity file':
  path => '/etc/ssh/ssh_config',
  line => '  IdentityFile ~/.ssh/school',
}
