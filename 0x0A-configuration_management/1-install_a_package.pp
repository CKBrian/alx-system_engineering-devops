# installs flask package version 2.1.0 using pip3
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

# installs werkzeug
package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}
