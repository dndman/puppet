class apacheinstall {
include apinstall
include apservice
}

class apinstall {
package { 'apache2':
        require => exec['updatemod'],
        ensure => installed,
}
exec { 'updatemod':
command => '/usr/bin/apt-get update',
}
exec { 'updatemessage':
	require => package['apache2'],
	command => '/usr/bin/wall apache2 installed',
}
}


class apservice {
service { 'apache2':
         require => package['apache2'],
         ensure => running,
         }
exec { 'apacheservicemessage':
	require => service['apache2'],
	command => '/usr/bin/wall apache2 is started',
}
}