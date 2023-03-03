Function setproxy {
    $env:ALL_PROXY="socks5://127.0.0.1:10808"
}
Function unsetproxy {
    $env:ALL_PROXY=""
}
Function ssh_iop {
    ssh "root@192.168.xx.xx"
}
Function git_g {
    git config user.email  "zhifengle@gmail.com"
    git config user.name "zhifengle"
}

Function upload_iop_server() {
    $pw_xx="xx"
    # pscp  Putty
    # WinSCP 或者
    scp d:\iop.zip root@192.168.xx.xxx:/root/iop-fe
}
