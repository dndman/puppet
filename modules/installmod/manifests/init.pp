import '/usr/share/puppet/modules/installmod/manifests/cs-installmod/*'
import '/usr/share/puppet/modules/installmod/manifests/me-installmod/*'

case $operatingsystem {
    centos: {
	$apacheinstall = "csapacheinstall"
	$htopinstall   = "cshtopinstall"
	$ntpinstall    = "csntpinstall"
	$pythoninstall = "cspythoninstall"
	$sshinstall    = "cssshinstall"
}


    ubuntu: {
        $apacheinstall = "uapacheinstall"
	$htopinstall   = "uhtopinstall"
	$ntpinstall    = "untpinstall"
	$pythoninstall = "upythoninstall"
	$sshinstall    = "usshinstall"
}
}


class installmod {
    include $apacheinstall
    include $htopinstall
    include $ntpinstall
    include $pythoninstall
    include $sshinstall
}
