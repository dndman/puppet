class pythoninstall {
include pinstall
}

class pinstall {
package { 'python':
        require => exec['updatemod'],
        ensure => installed,
}
#exec { 'updatemod':
#command => '/usr/bin/apt-get update',
#}
exec { 'pythomupdatemessage':
	require => package['python'],
	command => '/usr/bin/wall python installed',
}
}
