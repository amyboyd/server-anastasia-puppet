class developers::sudo_rights {
    sudo::conf { 'developers':
        priority => 10,
        content  => "%developers ALL=(ALL) NOPASSWD: ALL\n",
    }

    if $::serverEnv == 'dev' {
        sudo::conf { 'vagrant':
            priority => 10,
            content  => "%vagrant ALL=(ALL) NOPASSWD: ALL\n",
        }
    }
}
