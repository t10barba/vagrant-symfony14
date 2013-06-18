
class package_app_server
{

  package
  {
    'sendmail':
      ensure  => present
  }

  package
  {
    'apache2':
      ensure  => present,
  }

  /* MySQL
  package
  {
    'mysql-server':
      ensure  => present
  }

  package
  {
    'mysql-client':
      ensure  => present
  }
  */

  package
  {
    'php5':
      ensure  => present,
      require => Package['apache2']
  }

  package
  {
    'php5-intl':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php-apc':
      ensure  => present,
      require => Package['php5']
  }
  
  /*
  package
  {
    'php5-xdebug':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'kcachegrind':
      ensure  => present,
      require => Package['php5-xdebug']
  }
  */

  package
  {
    'php5-curl':
      ensure  => present,
      require => Package['php5']
  }
  
  package
  {
    'php5-xsl':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php5-mysql':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php5-sqlite':
      ensure  => present,
      require => Package['php5']
  }
  
  package
  {
    'phpmyadmin':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php5-cli':
      ensure  => present,
      require => Package['php5']
  }

  package
  {
    'php-pear':
      ensure  => present,
      require => Package['php5-cli']
  }
  
  package
  {
    'imagemagick':
      ensure  => present,
      require => Package['php5']
  }
  
  package
  {
    'php5-imagick':
      ensure  => present,
      require => Package['imagemagick']
  }
  
  package
  {
    'graphviz':
      ensure  => present,
      require => Package['php5-cli']
  }

  file
  {
    'pear.tmpdirfix.prepare':
      ensure  => directory,
      path    => '/tmp/pear',
      require => Package['php-pear']
  }

  file
  {
    'pear.tmpdirfix':
      ensure  => directory,
      path    => '/tmp/pear/cache',
      mode    => 777,
      require => File['pear.tmpdirfix.prepare']
  }

  exec
  {
    'pear.upgrade.pear':
      path => '/bin:/usr/bin:/usr/sbin',
      command => 'pear upgrade PEAR',
      require => File['pear.tmpdirfix']
  }

}
