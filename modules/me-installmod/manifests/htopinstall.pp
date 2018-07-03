class htopinstall {
include hinstall
}

class hinstall {
package { 'htop':
        require => exec['updatemod'],
        ensure => installed,
}
#exec { 'updatemod':
#command => '/usr/bin/apt-get update',
#}
exec { 'htopinstallmessage':
	require => package['htop'],
	command => '/usr/bin/wall htop installed',
}
}
