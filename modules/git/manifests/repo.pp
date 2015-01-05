define git::repo() {
    file { "/home/git/repos/$name.git":
        ensure => directory,
        owner => 'git',
        require => User['git'],
    }

    exec { "init $name repo":
        command => 'git init --bare',
        cwd => "/home/git/repos/$name.git",
        creates => "/home/git/repos/$name.git/config",
        user => 'git',
        require => File["/home/git/repos/$name.git"]
    }
}
