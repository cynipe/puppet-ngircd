define ngircd::operator(
  $ensure   = present,
  $password = '',
  $mask     = '*!*@*',
){

 file { "/etc/ngircd.d/10-operator-${name}.conf":
    ensure  => $ensure,
    content => template('ngircd/operator.erb'),
    notify  => Exec['rebuild-ngircd-conf'],
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
