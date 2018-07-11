class usshinstall {
    include sinstall
    include nservice
}

class sinstall {
    package { 'ssh':
        require => exec['updatemod'],
        ensure => installed,
}
    exec { 'sshinstallmessage':
	require => package['ssh'],
	command => '/usr/bin/wall ssh installed',
}
}


class sservice {
    service { 'ssh':
	require => package['ssh'],
	ensure => running,
}
    exec { 'sshconfirm':
	require => service['ssh'],
	command => '/usr/bin/wall ssh is started',
}
}