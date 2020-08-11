#!/bin/bash

# before cleanup
before=$(df / -Pm | awk 'NR==2{print $4}')

# clears out the local repository of retrieved package files
# It removes everything but the lock file from /var/cache/apt/archives/ and /var/cache/apt/archives/partial
apt-get clean
rm -rf /tmp/*

# after cleanup
after=$(df / -Pm | awk 'NR==2{print $4}')

( cd / ; rm -rf get-pip.py minikube-linux-amd64 packages-microsoft* phantomjs session-manager* )

# display size
 echo "Before: $before MB"
 echo "After : $after MB"
 echo "Delta : $(($after-$before)) MB"