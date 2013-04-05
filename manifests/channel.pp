define ngircd::channel(
  $channel  = $title,
  $ensure   = present,
  $topic    = '',
  $modes    = 'tnk',
  $key      = '',
){

 file { "/etc/ngircd.d/20-channel-${channel}.conf":
    ensure  => $ensure,
    content => template('ngircd/channel.erb'),
    notify  => Exec['rebuild-ngircd-conf'],
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
