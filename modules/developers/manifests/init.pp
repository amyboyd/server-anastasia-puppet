class developers {
    group { 'developers':
        ensure => present,
    }

    developers::developer { 'bernardo.silva': }
    developers::developer { 'amy.boyd': }

    include developers::sudo_rights
}
