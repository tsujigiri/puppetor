class tor::run {
  service { 'tor':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['tor'],
  }
}
