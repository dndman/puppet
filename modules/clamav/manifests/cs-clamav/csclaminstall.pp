class csclaminstall {
    include csclam
    include csclmessage
}

class csclam {
    package { [
'clamav-server',
'clamav-data',
'clamav-update',
'clamav-filesystem',
'clamav',
'clamav-scanner-systemd',
'clamav-devel',
'clamav-lib',
'clamav-server-systemd',
]:
	require => Class['sysupdatemod'],
	ensure => installed,
#i dont sure what doing this part. 
#i know just know it fix "Error: No 	matching Packages to list"
	allow_virtual => true,
}
}

class csclmessage {
    exec { 'csclmessage':
	require => Class['csclam'],
	command => '/usr/bin/wall clamav installed',
}
}
