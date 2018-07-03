class csclaminstall {
include csclam
include csclmessage
}

class csclam {
package { [
'clamav-server',
'clamav-data',
'clamav-update',
'clamav-filesystem',
'clamav',
'clamav-scanner-systemd',
'clamav-devel',
'clamav-lib',
'clamav-server-systemd',
]:
        require => Class['csupdatemod'],
        ensure => installed,
}
}

class csclmessage {
exec { 'csclmessage':
	require => Class['csclam'],
	command => '/usr/bin/wall clamav installed',
}
}
#class csservice {
#service { 'clamav-daemon':
#         require => package['clampack'],
#         ensure => running,
#         }
#exec { 'csclamavemessage':
#	require => service['clamav-daemon'],
#	command => '/usr/bin/wall clamav is started',
#}
#}

