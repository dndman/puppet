class pythoninstall {
    include pinstall
}

class pinstall {
    package { 'python':
	require => exec['updatemod'],
	ensure => installed,
}
    exec { 'pythomupdatemessage':
	require => package['python'],
	command => '/usr/bin/wall python installed',
}
}
