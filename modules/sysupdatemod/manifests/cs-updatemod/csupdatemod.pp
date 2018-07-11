class csupdatemod {
    exec { 'csupdatemod':
	command => '/usr/bin/yum -y update',
}
    exec { 'csepel':
	require => exec['csupdatemod'],
	command => '/usr/bin/yum -y install epel-release',
}

    exec { 'epelclean':
	require => exec['csepel'],
	command => '/usr/bin/yum clean all',
}

    exec { 'epelupdate':
	require => exec['epelclean'],
	command => '/usr/bin/yum -y update',
}
    exec { 'csupdatewall':
	require => exec['epelupdate'],
	command => '/usr/bin/wall updated, epel installed'
}
}

