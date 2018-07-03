class cshtopinstall {
include cshinstall
}

class cshinstall {
package { 'htop':
        require => Class['csupdatemod'],
        ensure => installed,
}

exec { 'cshtopinstallmessage':
	require => package['htop'],
	command => '/usr/bin/wall htop installed',
}
}
