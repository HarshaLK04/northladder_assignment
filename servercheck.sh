#!/bin/bash

# actual ip will be replaced
REMOTE_SERVER="192.168.1.100"

# check determine  whether the remote server is windows or linux
is_windows() {
    ssh "$REMOTE_SERVER" 'systeminfo' 2>/dev/null | grep -iq 'Microsoft Windows' && return 0
    return 1
}

is_linux() {
    ssh "$REMOTE_SERVER" 'uname' 2>/dev/null | grep -iq 'linux' && return 0
    return 1
}

if is_windows; then
    echo "Remote server is running Windowss"
elif is_linux; then
    echo "Remote server is running Linux"
else
    echo "Unable to determine the operating system"
fi
