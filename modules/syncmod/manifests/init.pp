import '/usr/share/puppet/modules/makefilemod/manifests/cs-syncmod/*'
import '/usr/share/puppet/modules/makefilemod/manifests/me-syncmod/*'

case $operatingsystem {
 centos: {
    $modsync = "csmodsync"
            }
 ubuntu: {
    $modsync  = "umodsync"
            }
}



class syncmod {
    include $modsync
}
