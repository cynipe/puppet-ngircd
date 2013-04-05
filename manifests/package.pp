class ngircd::package {

  package{'ngircd':
    ensure => $ngircd::ensure,
  }
}
