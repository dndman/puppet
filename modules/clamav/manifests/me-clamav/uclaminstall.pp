class uclaminstall {
    include uclam
    include ucservice
}

class uclam {
    package { ['clamav','clamav-daemon']:
	require => Class['sysupdatemod'],
	ensure => installed,
}
    exec { 'uclammessage':
	require => package['clamav','clamav-daemon'],
	command => '/usr/bin/wall clamav installed',
}
}


class ucservice {
    service { 'clamav-daemon':
	require => package['clamav','clamav-daemon'],
	ensure => running,
         }
    exec { 'uclamavemessage':
	require => service['clamav-daemon'],
	command => '/usr/bin/wall clamav is started',
}
}

