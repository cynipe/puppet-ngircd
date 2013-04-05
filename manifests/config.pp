class ngircd::config{
    File {
        owner => 'root',
        group => 'root',
        mode  => '0644',
    }

    file {
      '/etc/ngircd.d':
        ensure  => directory,
        purge   => true,
        recurse => true;

      '/etc/ngircd.d/00-ngircd.conf':
        ensure  => file,
        content => template('ngircd/ngircd.conf.erb'),
        notify  => Exec['rebuild-ngircd-conf'];

    }

}
