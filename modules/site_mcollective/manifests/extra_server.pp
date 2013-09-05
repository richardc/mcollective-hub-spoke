#
define site_mcollective::extra_server {
  $config = "/etc/mcollective/server-${title}.cfg"
  $identity = "${::hostname}-${title}.${::domain}"

  concat { $config: }
  concat::fragment { "server-${title}_header":
    target => $config,
    ensure => '/etc/mcollective/server.cfg',
    order  => '00',
  }

  concat::fragment { "server-${title}_specific":
    target  => $config,
    content => template('site_mcollective/server-specific.cfg.erb'),
    order   => '10',
  }

  file { "/etc/init.d/mcollective-${title}":
    mode    => '0755',
    content => template('site_mcollective/mcollective.init.erb'),
    require => Concat[$config],
  } ~>

  service { "mcollective-${title}":
    ensure    => 'running',
    enable    => true,
    subscribe => Concat[$config],
  }
}
