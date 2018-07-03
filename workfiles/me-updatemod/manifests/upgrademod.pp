class upgrademod {
    exec { 'upgrademod':
    require => exec['updatemod'],
    command => '/usr/bin/apt-get -y upgrade',
	 }
    exec { 'upgrademessage':
    require => exec['upgrademod'],
    command => '/usr/bin/wall upgrademod success',
	 }
}