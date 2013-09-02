#
class activemq::config {
  file { '/opt/apache-activemq/conf/activemq.xml':
    content => template('activemq/activemq.xml.erb'),
  }
}
