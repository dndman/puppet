#this part is about installation of packages with apache2 as example

#ubuntu example
class apache {
resource { 'apt-update':
command => '/usr/bin/apt-get update'
}

package { 'apache2':
require => resource,
ensure => installed,
}

service { 'apache2':
require => resource,
ensure => running,
}
}

node default { }
node 'ubuntu' {
include apache
}
#centos example


