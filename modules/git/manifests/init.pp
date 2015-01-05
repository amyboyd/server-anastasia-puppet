class git {
    package { ['git']:
        ensure => present,
    }

    user { 'git':
        ensure => present,
        managehome => true,
    }

    file {'/home/git/.ssh':
        ensure  => 'directory',
        owner   => 'git',
        group   => 'git',
        mode    => '0600',
    }

    file {'/home/git/.ssh/authorized_keys':
        ensure  => file,
        owner   => 'git',
        group   => 'git',
        mode    => '0600',
        content => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUE8jD9JXyKj8XfxhGZZRUJJwNPqeTHg+VTmB69SPNelxPVRt/0OdnxMdrwQSvpeZutZPtWSue3Ghm0suXcgI1P9OAqFRzxlcAq4V4Zh1O+ygesCv1Etezl0nnzCMVfgZus/H7qC+vOOAkTRraQi8pVOLyI+Q4i4F0cqJSfX9W0sENhVxPLR+Gjb4Ka8hxWP4wcSgne2IeuAk3gcEHoKfoAciW/THc6Aa8bUejMHdHMFMHizOQiSLK0JIgS7CqDTIEaxr5L5tI4ZIQeglsjenqOi4Y3zkJwQNTCVjXd8wnKmx5vZBgshhPKGKTRFQ5+Qh3C0GdpJHg/a3inb5Q6N07',
        require => File['/home/git/.ssh'],
    }

    file { '/home/git/repos':
        ensure => directory,
        owner => 'git',
        require => User['git'],
    }
}
