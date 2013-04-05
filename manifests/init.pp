class ngircd(
  $ensure               = present,
  $servername           = 'localhost.localdomain',
  $listen_addresses     = '127.0.0.1',
  $ports                = '6667',
  $oper_can_use_mode    = 'no',
  $oper_server_mode     = 'no',
  $predef_channels_only = 'no'
){

  include ngircd::package
  include ngircd::config
  include ngircd::service

  anchor{ 'ngircd::begin': } ->
  Class['ngircd::package'] ->
  Class['ngircd::config'] ->
  Ngircd::Operator <| |> ->
  Ngircd::Channel <| |> ->
  Class['ngircd::service'] ->
  anchor{ 'ngircd::end': }

}
