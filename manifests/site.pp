node 'hub.example.com' {
  class { 'puppetlabs_repos': } ->
  package { 'hiera':
    ensure => latest,
  } ->
  class { 'mcollective':
    client             => true,
    middleware         => true,
    middleware_hosts   => [ 'localhost' ],
    main_collective    => 'global',
    collectives        => 'global,eu,eu_infra',
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

node /^broker\d+\.example.com/ {
  $mcollective_hub = 'hub.example.com'
  class { 'puppetlabs_repos': } ->
  package { 'hiera':
    ensure => latest,
  } ->
  class { 'mcollective':
    client             => true,
    middleware         => true,
    middleware_hosts   => [ 'localhost' ],
    main_collective    => 'global',
    collectives        => 'global,eu,eu_infra',
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
  class { 'puppetlabs_repos': } ->
  package { 'hiera':
    ensure => latest,
  } ->
  class { 'mcollective':
    main_collective    => 'global',
    collectives        => 'global,eu,eu_infra',
    middleware_hosts   => [ 'broker1.example.com', 'broker2.example.com', 'broker3.example.com' ],
    ssl_client_certs   => 'puppet:///modules/site_mcollective/certs',
    ssl_ca_cert        => 'puppet:///modules/site_mcollective/certs/ca.pem',
    ssl_server_public  => 'puppet:///modules/site_mcollective/certs/server.pem',
    ssl_server_private => 'puppet:///modules/site_mcollective/private_keys/server.pem',
  }
}
