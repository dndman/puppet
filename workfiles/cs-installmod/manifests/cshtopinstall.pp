class cshtopinstall {
include cshinstall
}

class cshinstall {
package { 'htop':
        require => exec['csupdatemod'],
        ensure => installed,
}

exec { 'cshtopinstallmessage':
	require => package['htop'],
	command => '/usr/bin/wall htop installed',
}
}
