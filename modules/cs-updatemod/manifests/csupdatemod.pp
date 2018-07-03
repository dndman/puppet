class csupdatemod {
    exec { 'csupdatemod':
	command => '/usr/bin/yum -y update',
}
    exec { 'csepel':
	require => exec['csupdatemod'],
	command => '/usr/bin/yum -y install epel-release',
}
    exec { 'epelupdate':
	require => exec['csepel'],
	command => '/usr/bin/yum -y update',
}
}