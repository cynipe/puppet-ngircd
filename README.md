# ngIRCd Puppet Module

## Usage

### Installing ngIRCd

default:
```puppet
include ngircd
```

custom:
```puppet
class { 'ngircd':
  servername            => $::fqdn,
  listen_addresses      => $::ipaddress,
  oper_can_use_mode     => 'yes',
  oper_server_mode      => 'yes',
  $predef_channels_only => 'yes'
}
```

### Managing Operator

```puppet
ngircd::operator { 'cynipe':
  password => 'plain-password',
  mask     => '*!ident@somewhere.example.com'
}

```

### Managing Pre Defained Channel

```puppet
ngircd::channel { 'lobby':
  topic => 'Sup?',
  modes => 'tnk',
  key   => 'plain key for channel'.
}
```
