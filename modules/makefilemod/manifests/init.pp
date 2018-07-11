import '/usr/share/puppet/modules/makefilemod/manifests/cs-makefilemod/*'
import '/usr/share/puppet/modules/makefilemod/manifests/me-makefilemod/*'

case $operatingsystem {
 centos: {
    $createfile = "cscreatefile"
            }
 ubuntu: {
    $createfile  = "ucreatefile"
            }
}




class makefilemod {
    include $createfile
}
