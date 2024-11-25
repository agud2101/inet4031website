# Install Apache2
package { 'apache2':
  ensure => installed,
}

# Install PHP
package { 'php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

# Manage Apache2 service
service { 'apache2':
  ensure => running,
  enable => true,
  require => [Package['apache2'], Package['php']],
}

# Install PHP MySQL Connector
package { 'php-mysql':
  ensure => installed,
}

# Ensure the phpinfo.php file is placed in the correct directory
file { '/var/www/html/phpinfo.php':
  source => 'file:///home/gududo/puppet_dev/phpinfo.php',  # Adjust the path if needed
  notify => Service['apache2'],
  require => [Package['apache2']],
}

