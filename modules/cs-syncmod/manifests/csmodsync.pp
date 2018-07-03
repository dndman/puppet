class csmodsync {
include cssyncdircreate
include cssync
#include srvsync
}

class cssyncdircreate {
include cssyncdir
include csdirmessage
}

class cssyncdir {
file {
[
'/tmp/syncdir/', 
'/tmp/syncdir/ponysync', 
'/tmp/syncdir/yumlogsync'
]:
    require => Class['cs-makefilemod'],
    ensure => 'directory',
    replace => 'no',
}
}
class csdirmessage {
    exec { 'cssyncdirmessage':
    command => '/usr/bin/wall syncronysation directories created or already exist',
    require => Class['cssyncdir'],
}
}


class cssync {
file { '/tmp/syncdir/ponysync/pony':
ensure => 'present',
replace => 'yes',
source => '/tmp/testdir/ponyfile',
}
file { '/tmp/syncdir/yumlogsync/yumlog':
ensure => 'present',
replace => 'yes',
source => '/var/log/yum.log',
}
}

class cssrvsync {
file { '/tmp/syncdir/serverdata':
ensure => 'present',
replace => 'yes',
source => 'puppet:///etc/puppet/manifests/site.pp',
}
}