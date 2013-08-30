#
class activemq::config {
  file { '/etc/activemq/activemq.xml':
    content => template('activemq/activemq.xml.erb'),
  }
}
