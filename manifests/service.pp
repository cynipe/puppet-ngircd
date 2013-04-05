class ngircd::service {

  exec { 'rebuild-ngircd-conf':
    command     => "/bin/echo -n > /etc/ngircd.conf && /bin/find /etc/ngircd.d -name '*.conf' -print | sort | xargs cat >> /etc/ngircd.conf",
    refreshonly => true,
    notify      => Service['ngircd']
  }

  service{ 'ngircd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true
  }
}
