#!/bin/bash

# Replace with the actual IP address or hostname of your remote server
REMOTE_SERVER="192.168.1.100"

# Attempt to determine the OS
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
