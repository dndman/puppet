class createfile {
    include crdir
    include crfile
}

class crdir {
    file { '/tmp/testdir':
	ensure => 'directory',
}
    exec { 'dircreation':
	command => '/usr/bin/wall directory created',
	require => file['/tmp/testdir']
}
}
class crfile {
    file { '/tmp/testdir/ponyfile':
	ensure => 'present',
	replace => 'no',
	content => 'pony can fly',
	mode => '644',
	require => file['/tmp/testdir'],
}
    exec { 'filecreation':
	command => '/usr/bin/wall PONY CAN FLY!',
}
}