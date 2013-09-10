# Activemq Hub-Spoke example install

This module creates an activemq hub-spoke configuration with multiple
mcollective agents per node.  These nodes connect just to the 'spoke'
brokerNN machines.

mcollective clients will typically connect to the hub host, or one of
the spokes to issue commands.

## Configuration

Configuration of the environment and puppet classes is controlled by
the contents of data/common.json.  This is slurped by the Vagrantfile
and interrogated via hiera/databings from the puppet provisioning
manifests.

  {
    "spoke_demo::brokers": "2",
    "spoke_demo::nodes": "10",
    "spoke_demo::extra_agents": "50",
    "spoke_demo::network": "192.168.19",
    "spoke_demo::domain": "example.com"
  }
