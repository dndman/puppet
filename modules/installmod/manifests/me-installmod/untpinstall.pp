class untpinstall {
    include ninstall
    include nservice
}

class ninstall {
    package { 'ntp':
	require => exec['updatemod'],
	ensure => installed,
}
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