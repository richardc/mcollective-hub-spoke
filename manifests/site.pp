node 'hub.example.com', /^broker\d+\.example.com/ {
  if $hostname =~ /broker/ {
    $mcollective_hub = 'hub.example.com'
  }

  class { 'vagrant_hosts': } ->
  class { 'puppetlabs_repos': } ->
  package { 'hiera':
    ensure => latest,
  } ->
  class { 'mcollective':
    client             => true,
    middleware         => true,
    middleware_hosts   => [ 'localhost' ],
    securityprovider   => 'psk',
    activemq_template  => 'site_mcollective/activemq.xml.erb',
    ssl_client_certs   => 'puppet:///modules/site_mcollective/certs',
    ssl_ca_cert        => 'puppet:///modules/site_mcollective/certs/ca.pem',
    ssl_server_public  => 'puppet:///modules/site_mcollective/certs/server.pem',
    ssl_server_private => 'puppet:///modules/site_mcollective/private_keys/server.pem',
  }

  mcollective::user { 'vagrant':
    certificate => 'puppet:///modules/site_mcollective/certs/root.pem',
    private_key => 'puppet:///modules/site_mcollective/private_keys/root.pem',
  }
}

node /^node\d+.example.com/ {
  class { 'vagrant_hosts': } ->
  class { 'puppetlabs_repos': } ->
  package { 'hiera':
    ensure => latest,
  } ->
  class { 'mcollective':
    middleware_hosts   => [ 'broker1.example.com', 'broker2.example.com', 'broker3.example.com' ],
    securityprovider   => 'psk',
    ssl_client_certs   => 'puppet:///modules/site_mcollective/certs',
    ssl_ca_cert        => 'puppet:///modules/site_mcollective/certs/ca.pem',
    ssl_server_public  => 'puppet:///modules/site_mcollective/certs/server.pem',
    ssl_server_private => 'puppet:///modules/site_mcollective/private_keys/server.pem',
  }
}
