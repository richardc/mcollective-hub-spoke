#
class spoke_demo(
  $brokers = 2,
  $nodes   = 10,
  $network = '192.168.19',
  $domain  = 'example.com',
) {
  host { "hub.${domain}":
    ip => "${network}.10",
  }

  $broker_ids = range(0, $brokers - 1)
  spoke_demo::broker { $broker_ids:
    network => $network,
    domain  => $domain,
  }

  $node_ids = range(0, $nodes - 1)
  spoke_demo::node { $node_ids:
    network => $network,
    domain  => $domain,
  }
}
