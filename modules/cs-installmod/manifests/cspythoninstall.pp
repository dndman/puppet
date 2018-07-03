class cspythoninstall {
include cspinstall
}

class cspinstall {
package { 'python':
        require => Class['csupdatemod'],
        ensure => installed,
}
exec { 'cspythomupdatemessage':
	require => package['python'],
	command => '/usr/bin/wall python installed',
}
}
