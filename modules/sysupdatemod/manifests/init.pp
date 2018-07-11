import '/usr/share/puppet/modules/sysupdatemod/manifests/cs-updatemod/*'
import '/usr/share/puppet/modules/sysupdatemod/manifests/me-updatemod/*'
#import '/usr/share/puppet/modules/sysupdatemod/manifests/me-updatemod/upgrademod.pp'

case $operatingsystem {
 centos: {
    $sysupdate = "csupdatemod"
            }
 ubuntu: {
    $sysupdate  = "updatemod"
    $sysupgrade = "upgrademod"
            }
}


class sysupdatemod {
    include $sysupdate
    include $sysupgrade
}
