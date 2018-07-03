class claminstall {
include claminstall
include cservice
}

class claminstall {
package { ['clamav','clamav-daemon']:
        require => exec['updatemod'],
        ensure => installed,
}
#exec { 'updatemod':
#command => '/usr/bin/apt-get update',
#}
exec { 'clamupdatemessage':
	require => package['clamav','clamav-daemon'],
	command => '/usr/bin/wall clamav installed',
}
}


class cservice {
service { 'clamav-daemon':
         require => package['clamav','clamav-daemon'],
         ensure => running,
         }
exec { 'clamavemessage':
	require => service['clamav-daemon'],
	command => '/usr/bin/wall clamav is started',
}
}

