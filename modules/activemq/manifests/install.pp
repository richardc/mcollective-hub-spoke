#
class activemq::install {
  exec { 'unpack tarball':
    command => 'tar xzf /vagrant/dist/apache-activemq-5.8.0-bin.tar.gz',
    cwd     => '/opt',
    creates => '/opt/apache-activemq-5.8.0',
  } ->
  
  file { '/opt/apache-activemq':
    ensure => 'link',
    source => '/opt/apache-activemq-5.8.0',
  }
}
