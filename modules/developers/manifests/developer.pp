define developers::developer($groups = [], $home = "/home/${name}") {
    user { $name:
        ensure     => present,
        managehome => true,
        shell      => '/bin/bash',
        groups     => $groups,
        home       => $home,
    }

    file { $home:
        ensure  => directory,
        owner   => $name,
        group   => $name,
        require => User[$name],
    }

    file { "${home}/.ssh":
        ensure  => directory,
        owner   => $name,
        group   => $name,
        require => File[$home],
    }

    file { "${home}/.ssh/authorized_keys":
        ensure  => file,
        owner   => $name,
        group   => $name,
        mode    => '0600',
        source  => "puppet:///modules/developers/${name}.authorized_keys.txt",
        require => File["${home}/.ssh"],
    }
}
