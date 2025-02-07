#!/bin/bash

image=$1
host=$2
port=$3
user=$4

cleanup() {
    echo "Cleaning up background processes..."
    kill -9 $(jobs -p)
}

configure_ssh(){
    # Prune outdated config
    rm -rf ~/.ssh/config
    echo "Host target" >> ~/.ssh/config
    echo "   HostName = $host" >> ~/.ssh/config
    echo "   Port = $port" >> ~/.ssh/config
    echo "   User = $user" >> ~/.ssh/config
    echo "   IdentityFile = ~/.ssh/debug" >> ~/.ssh/config

    # Remove outdated keys
    ssh-keygen -R "[$host]:$port"

    # Wait until SSH server becomes available
    SSH_OPTIONS="-o ConnectTimeout=5 -p $port"  
    MAX_ATTEMPTS=30
    attempt=0

    # Store updated keys
    while ! ssh-keyscan -p $port $host  >> ~/.ssh/known_hosts
    do
        ((attempt++))
        if [ "$attempt" -ge "$MAX_ATTEMPTS" ]; then
            echo "Failed to connect to $host after $attempt attempts."
            exit 1
        fi
        sleep 5
    done

    
    
}


# Set trap
trap cleanup EXIT

# Start your commands in background
automotive-image-runner --port-forward 2345:2345,3456:3456 --nographics $image &

configure_ssh

if mountpoint -q /mnt/target; then umount /mnt/target; fi
if test -d /mnt/target; then rm -rf /mnt/target; fi 
mkdir -p /mnt/target

sshfs target:/ /mnt/target

# Wait for commands to finish or for a signal
clear
ssh target
exit
