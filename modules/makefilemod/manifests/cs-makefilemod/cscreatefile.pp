class cscreatefile {
    include cscrdir
    include cscrfile
}

class cscrdir {
    file { '/tmp/testdir':
	ensure => 'directory',
}
    exec { 'csdircreation':
	command => '/usr/bin/wall directory created',
	require => file['/tmp/testdir']
}
}
class cscrfile {
    file { '/tmp/testdir/ponyfile':
	ensure => 'present',
	replace => 'no',
	content => 'pony can fly',
	mode => '644',
	require => file['/tmp/testdir'],
}
    exec { 'csfilecreation':
	command => '/usr/bin/wall PONY CAN FLY!',
}
}