class passwd {
    file { "/etc/passwd":
	owner => root,
	group => root,
	mode => 644,
}
}



node default {
    include sysupdatemod
    include passwd
    include clamav
    include installmod
    include makefilemod
    include syncmod
    include usercontrol
}

