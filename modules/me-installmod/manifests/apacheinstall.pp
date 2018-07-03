class apacheinstall {
    include apinstall
    include apservice
}

class apinstall {
    package { 'apache2':
	require => exec['updatemod'],
	ensure => installed,
}

    exec { 'apacheinstallmessage':
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