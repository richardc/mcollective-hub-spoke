#
class vagrant_hosts {
  host { 'hub.example.com':
    ip => '192.168.19.10',
  }

  $brokers = range(0, 10)
  vagrant_hosts::broker { $brokers: }

  $nodes = range(0,10)
  vagrant_hosts::node { $nodes: }
}
