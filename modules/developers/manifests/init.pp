class developers {
    group { 'developers':
        ensure => present,
    }

    developers::developer { 'bernardo.silva':
        groups => ['developers'],
    }

    developers::developer { 'amy.boyd':
        groups => ['developers'],
    }

    include developers::sudo_rights
}
