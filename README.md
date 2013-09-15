# Puppetor

A Puppet module for provisioning Tor nodes

## Requirements

This module is written for Debian 6.0 (squeeze), as the sources.list is specific
to this distro and release. This can be easily adapted to a distro of your
choice, following the instructions on the respective sub-page of:

  https://www.torproject.org/docs/installguide.html.en

## Usage

Put the following into your node config file:

```puppet
node 'tor-server' {
  include tor

  tor::configure { 'tor-server':
    torrc_path => 'puppet:///modules/tor/torrc_relay',
  }
}
```

The torrc included sets up a tor relay. Review it carefully and adapt to your
needs, or use your own.

Put this repository's contents into `/etc/puppet/modules/tor` and run
`puppet apply path/to/your/node.pp`.

## License

See: [LICENSE](LICENSE).
