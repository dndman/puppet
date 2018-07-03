class cspythoninstall {
include cspinstall
}

class cspinstall {
package { 'python':
        require => exec['csupdatemod'],
        ensure => installed,
}
exec { 'cspythomupdatemessage':
	require => package['python'],
	command => '/usr/bin/wall python installed',
}
}
