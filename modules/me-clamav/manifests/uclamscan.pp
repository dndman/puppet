class uclamscan {
cron { 'uclamscan':
  require => Class['uclaminstall'],
  command => '/usr/bin/clamscan -r /root',
  user    => 'root',
  weekday    => ['4'],
  hour => '0'
}
}