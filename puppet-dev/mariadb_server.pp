# mariadb_server.pp

# Install MariaDB
package { 'mariadb-server':
  ensure => installed,
}

# Ensure MariaDB service is running
service { 'mariadb':
  ensure => running,
  enable => true,
  require => Package['mariadb-server'],
}

