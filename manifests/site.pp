Exec {
    path => '/bin:/usr/bin'
}

include git
git::repo { 'nicesky': }
git::repo { 'server-anastasia-puppet': }

bash::aliases { 'bash aliases for root':
    file => '/root/.bash_aliases'
}
bash::aliases { 'bash aliases for git user':
    file => '/home/git/.bash_aliases'
}
