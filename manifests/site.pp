Exec {
    path => '/bin:/usr/bin'
}

include git
git::repo { 'nicesky': }
git::repo { 'server-anastasia-puppet': }

exec { 'create bash_aliases':
    command => 'wget -nc https://raw.githubusercontent.com/amyboyd/amybits/master/.bash_profile_for_linux -O /root/.bash_aliases',
    creates => '/root/.bash_aliases',
}
