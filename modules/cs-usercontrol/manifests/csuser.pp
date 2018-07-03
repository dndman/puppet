class csuser {
    user { 'csuser':
	name => 'csuser',
	home => '/home/csuser',
	managehome => true,
	shell => '/bin/bash',
	ensure => present,
	password => 'guDIJNwTzMwTE',
#there is password hash, created by "mkpasswd" from "whois' packet. you need to generate and insert new.
	groups => [wheel, csgroup],
	require => Class['csgroup'],
}
}
class csgroup {
    group { 'csgroup':
	name => 'csgroup',
#  gid => '100500', 
#for example,if specify gid needed
	ensure => present,
}
}

class csconfirmation {
    exec { 'csconfirmation':
    require => Class['csuser','csgroup'],
    command => '/usr/bin/wall user and group has been created or are exist',
}
}