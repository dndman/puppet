class uuser {
    user { 'uuser':
	name => 'ubuntuuser',
	home => '/home/ubuntuuser',
	managehome => true,
	shell => '/bin/bash',
	ensure => present,
	password => 'guDIJNwTzMwTE',
#there is password hash, created by "mkpasswd" from "whois' packet. you need to generate and insert new.
	groups => [sudo, ubuntugroup],

}
}
class ugroup {
    group { 'ubuntugroup':
	name => 'ubuntugroup',
#  gid => '100500', 
#for example,if specify gid needed
	ensure => present,
}
}

class uconfirmation {
    exec { 'uconfirmation':
	require => Class['uuser','ugroup'],
	command => '/usr/bin/wall user and group has been created or are exist',
}
}