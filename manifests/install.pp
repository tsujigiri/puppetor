class tor::install {
  file { '/etc/apt/sources.list':
    source => 'puppet:///modules/tor/sources.list',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
  }

  exec { 'import_pgp_keys':
    path    => ['/bin', '/usr/bin'],
    command => 'gpg --keyserver keys.gnupg.net --recv 886DDD89 && gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -',
  }

  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    require => [
      File['/etc/apt/sources.list'],
      Exec['import_pgp_keys'],
    ]
  }

  package { 'tor':
    require => [
      Exec['apt-get update'],
      File['torrc'],
    ],
  }
}
