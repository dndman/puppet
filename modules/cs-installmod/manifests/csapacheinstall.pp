class csapacheinstall {
include csapinstall
include csapservice
}

class csapinstall {
package { 'httpd':
        require => Class['csupdatemod'],
        ensure => installed,
}
exec { 'httpdmessage':
	require => package['httpd'],
	command => '/usr/bin/wall httpd installed',
}
}


class csapservice {
service { 'httpd':
         require => package['httpd'],
         ensure => running,
         }
exec { 'httpdservicemessage':
	require => service['httpd'],
	command => '/usr/bin/wall httpd is started',
}
}