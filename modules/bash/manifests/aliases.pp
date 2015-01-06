define bash::aliases($file) {
    exec { "create ${file}":
        command => "wget -nc https://raw.githubusercontent.com/amyboyd/amybits/master/.bash_profile_for_linux -O ${file}",
        creates => $file,
    }
}
