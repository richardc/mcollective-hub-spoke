class puppetlabs_repos {
  if $::osfamily == 'RedHat' {
    yumrepo { 'puppetlabs-devel':
        baseurl  => 'http://yum.puppetlabs.com/el/6/devel/$basearch',
        descr    => 'Puppet Labs Devel El 6 - $basearch',
        enabled  => '1',
        gpgcheck => '0'
    } ->

    yumrepo { 'puppetlabs-deps':
        baseurl  => 'http://yum.puppetlabs.com/el/6/dependencies/$basearch',
        descr    => 'Puppet Labs Dependencies El 6 - $basearch',
        enabled  => '1',
        gpgcheck => '0'
    } ->

    yumrepo { 'puppetlabs-products':
        baseurl  => 'http://yum.puppetlabs.com/el/6/products/$basearch',
        descr    => 'Puppet Labs Products El 6 - $basearch',
        enabled  => '1',
        gpgcheck => '0'
    } ->

    yumrepo { 'epel':
        descr          => 'Extra Packages for Enterprise Linux 6 - $basearch',
        enabled        => '1',
        failovermethod => 'priority',
        gpgcheck       => '0',
        mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    } ->
    Package <| |>
  }

  if $::osfamily == 'Debian' {
    apt::source { 'puppetlabs':
      location   => 'http://apt.puppetlabs.com',
      repos      => 'main dependencies',
      key        => '4BD6EC30',
      key_server => 'pgp.mit.edu',
    } ->
    Package <| |>
  }
}
