class csntpinstall {
include csninstall
include csnservice
}

class csninstall {
package { 'ntp':
        require => Class['csupdatemod'],
        ensure => installed,
}
exec { 'csntpupdatemessage':
	require => package['ntp'],
	command => '/usr/bin/wall ntp installed',
}
}


class csnservice {
service { 'ntpd':
         require => package['ntp'],
         ensure => running,
         }
exec { 'csntpservicemessage':
	require => service['ntpd'],
	command => '/usr/bin/wall ntp is started',
}
}