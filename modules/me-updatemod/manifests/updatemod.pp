class updatemod {
    exec { 'updatemod':
	command => '/usr/bin/apt-get update',
	 }
    exec { 'updatemessage':
		require => exec['updatemod'],
		command => '/usr/bin/wall updatemod success',
	 }
}