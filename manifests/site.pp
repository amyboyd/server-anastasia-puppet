Exec {
    path => '/bin:/usr/bin'
}

include git
git::repo { 'nicesky': }
git::repo { 'server-anastasia-puppet': }
