#
class activemq::install {
  exec { 'unpack tarball':
    command => '/bin/tar xzf /vagrant/dist/apache-activemq-5.8.0-bin.tar.gz',
    cwd     => '/opt',
    creates => '/opt/apache-activemq-5.8.0',
  } ->

  file { '/opt/apache-activemq':
    ensure => 'link',
    target => '/opt/apache-activemq-5.8.0',
  }

  file { '/etc/init.d/activemq':
    ensure => 'file',
    source => 'puppet:///modules/activemq/activemq.init',
  }

  user { 'activemq':
    ensure => 'present',
  }

  #package { 'java':
  #  ensure => 'present',
  #}
}
