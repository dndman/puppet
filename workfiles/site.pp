class passwd {
file { "/etc/passwd":
owner => root,
group => root,
mode => 644,
}
}
node default { }
node ubuntu {
include passwd
include me-clamav
include me-installmod
include me-makefilemod
include me-syncmod
include me-updatemod
include me-usercontrol
}

