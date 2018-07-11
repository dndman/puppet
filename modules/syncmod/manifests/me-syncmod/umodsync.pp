class umodsync {
    include syncdircreate
    include sync
#include srvsync
}

class syncdircreate {
    include syncdir
    include dirmessage
}

class syncdir {
    file {
[
'/tmp/syncdir/', 
'/tmp/syncdir/ponysync', 
'/tmp/syncdir/syslogsync'
]:
	ensure => 'directory',
	replace => 'no',
}
}
class dirmessage {
#    include cbdir
    exec { 'syncdirmessage':
	command => '/usr/bin/wall syncronysation directories created or already exist',
	require => Class['syncdir'],
}
}


class sync {
    file { '/tmp/syncdir/ponysync/pony':
	require => Class['makefilemod'],
	ensure => 'present',
	replace => 'yes',
	source => '/tmp/testdir/ponyfile',
}
    file { '/tmp/syncdir/syslogsync/syslogfile':
	ensure => 'present',
	replace => 'yes',
	source => '/var/log/syslog',
}
}

class srvsync {
    file { '/tmp/syncdir/serverdata':
	ensure => 'present',
	replace => 'yes',
	source => 'puppet:///etc/puppet/manifests/site.pp',
}
}