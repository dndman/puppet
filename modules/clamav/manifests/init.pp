import '/usr/share/puppet/modules/clamav/manifests/cs-clamav/*'
#import '/usr/share/puppet/modules/clamav/manifests/cs-clamav/csclamscan.pp'
import '/usr/share/puppet/modules/clamav/manifests/me-clamav/*'
#import '/usr/share/puppet/modules/clamav/manifests/me-clamav/uclamscan.pp'


case $operatingsystem {
 centos: {
    $claminstall = "csclaminstall"
    $clamscan    = "csclamscan"
            }
 ubuntu: {
    $claminstall = "uclaminstall"
    $clamscan    = "uclamscan"
            }
}

class clamav {
    include $claminstall
    include $clamscan
}
