#
class activemq($hub = false, $spoke = false) {
  anchor { 'activemq::begin': } ->
  class { 'activemq::install': } ->
  class { 'activemq::config': } ~>
  class { 'activemq::service': } ->
  anchor { 'activemq::end': }
}
