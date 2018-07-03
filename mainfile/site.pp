class passwd {
file { "/etc/passwd":
owner => root,
group => root,
mode => 644,
}
}

case $operatingsystem {
centos: { $modpack = "centosmod" }
ubuntu: { $modpack = "ubuntumod" }
}

node default {
include $modpack
}


class ubuntumod {
include me-clamav
include me-installmod
include me-makefilemod
include me-syncmod
include me-updatemod
include me-usercontrol
}

class centosmod {
include cs-clamav
include cs-installmod
include cs-makefilemod
include cs-syncmod
include cs-updatemod
include cs-usercontrol
}
