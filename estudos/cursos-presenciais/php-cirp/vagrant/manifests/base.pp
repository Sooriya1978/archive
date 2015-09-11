#A basic configuration of a puppet file (manisfests/base.pp):
  #vagrant provision 

class basic {
  group { "puppet":
    ensure => "present",
  }

  exec {"apt_update":
    command => "apt-get update",
    path => "/usr/bin"
  }
}
include basic

#Apache2 Server
class apache {
  package { 'apache2':
    name => 'apache2-mpm-prefork',
    ensure => installed,
  }

  service { 'apache2':
    ensure  => running,
    require => Package['apache2'],
  }
}
include apache

#PHP Server
class php {
  package { ['php5', 'php5-gd','php5-mysql','php5-pgsql']: ensure => installed, }
}
include php

#Postgresql server
class postgresql {
  package { ['postgresql', 'postgresql-client']: ensure => installed, }
 
  service { 'postgresql':
    ensure => running,
    require => Package['postgresql'],
  }
}
include postgresql
