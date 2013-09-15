define tor::configure ($torrc_path) {
  include run

  file { '/etc/tor':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '755',
  }

  file { 'torrc':
    path    => '/etc/tor/torrc',
    source  => $torrc_path,
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    notify  => Service['tor'],
    require => File['/etc/tor'],
  }
}
