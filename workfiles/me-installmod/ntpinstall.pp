class ntpinstall {
include ninstall
include nservice
}

class ninstall {
package { 'ntp':
        require => exec['updatemod'],
        ensure => installed,
}
#exec { 'updatemod':
#command => '/usr/bin/apt-get update',
#}
exec { 'ntpupdatemessage':
	require => package['ntp'],
	command => '/usr/bin/wall ntp installed',
}
}


class nservice {
service { 'ntp':
         require => package['ntp'],
         ensure => running,
         }
exec { 'ntpservicemessage':
	require => service['ntp'],
	command => '/usr/bin/wall ntp is started',
}
}