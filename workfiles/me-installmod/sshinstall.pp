class updatemod {
    exec { 'updatemod':
	command => '/usr/bin/apt-get update',
	 }
    exec { 'updatemessage':
		require => exec['updatemod'],
		command => '/usr/bin/wall updatemod success',
	 }
}

class sshinstall {
include sinstall
include nservice
}

class sinstall {
package { 'ssh':
        require => exec['updatemod'],
        ensure => installed,
}
exec { 'updatemod':
command => '/usr/bin/apt-get update',
}
exec { 'updatemessage':
	require => package['ssh'],
	command => '/usr/bin/wall ssh installed',
}
}


class sservice {
service { 'ntp':
         require => package['ssh'],
         ensure => running,
         }
exec { 'sshconfirm':
	require => service['ssh'],
	command => '/usr/bin/wall ssh is started',
}
}