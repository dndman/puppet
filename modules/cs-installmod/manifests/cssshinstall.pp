class cssshinstall {
include cssinstall
include cssservice
}

class cssinstall {
package { 'openssh-server':
        require => Class['csupdatemod'],
        ensure => installed,
}
package { 'openssh-clients':
        require => exec['csupdatemod'],
        ensure => installed,
}

exec { 'cssshinstallmessage':
	require => package['openssh-server','openssh-clients'],
	command => '/usr/bin/wall ssh installed',
}
}


class cssservice {
service { 'sshd':
         require => Class['cssinstall'],
         ensure => running,
         }
exec { 'cssshconfirm':
	require => service['sshd'],
	command => '/usr/bin/wall ssh is started',
}
}