class clamscan {
cron { 'clamscan':
  require => Class['claminstall'],
  command => '/usr/bin/clamscan -r /root',
  user    => 'root',
  weekday    => ['4'],
  hour => '0'
}
}