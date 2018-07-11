import '/usr/share/puppet/modules/usercontrol/manifests/cs-usercontrol/*'
import '/usr/share/puppet/modules/usercontrol/manifests/me-usercontrol/*'

case $operatingsystem {
 centos: {
    $usercreate = "csuser"
    $groupcreate = "csgroup"
    $confirmation = "csconfirmation"
            }
 ubuntu: {
    $usercreate = "uuser"
    $groupcreate = "ugroup"
    $confirmation = "uconfirmation"
            }
}



class usercontrol {
    include $usercreate
    include $groupcreate
    include $confirmation
}
