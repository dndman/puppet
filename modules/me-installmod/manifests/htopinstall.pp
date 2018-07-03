class htopinstall {
    include hinstall
}

class hinstall {
    package { 'htop':
	require => exec['updatemod'],
	ensure => installed,
}
    exec { 'htopinstallmessage':
	require => package['htop'],
	command => '/usr/bin/wall htop installed',
}
}
