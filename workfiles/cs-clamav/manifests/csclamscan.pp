class csclamscan {
cron { 'csclamscan':
  require => Class['csclaminstall'],
  command => '/usr/bin/clamscan --log/tmp/clamlog /root',
  user    => 'root',
  weekday    => ['4'],
  hour => '0'
}
}