#!/bin/bash
# Ultra-Simple YUM Server Setup

# Verify DVD is mounted
DVD="/run/media/root/RHEL-8-10-0-BaseOS-x86_64"
if [ ! -d "$DVD/BaseOS" ]; then
  echo "ERROR: DVD not found at $DVD"
  echo "Insert RHEL DVD and try again"
  exit 1
fi

# Create repo directory
echo "Creating /yum-repo..."
sudo mkdir -p /yum-repo/rhel8/{BaseOS,AppStream}

# Copy files
echo "Copying packages..."
sudo cp -r "$DVD"/BaseOS/* /yum-repo/rhel8/BaseOS/
sudo cp -r "$DVD"/AppStream/* /yum-repo/rhel8/AppStream/

# Create YUM config
echo "Creating YUM config..."
sudo bash -c 'cat > /etc/yum.repos.d/local-rhel8.repo <<REPO
[local-BaseOS]
name=Local BaseOS
baseurl=file:///yum-repo/rhel8/BaseOS
enabled=1
gpgcheck=0

[local-AppStream]
name=Local AppStream
baseurl=file:///yum-repo/rhel8/AppStream
enabled=1
gpgcheck=0
REPO'

# Verify
echo "Testing repository..."
sudo dnf clean all
sudo dnf --disablerepo="*" --enablerepo="local-*" list available

echo "SUCCESS! Local YUM server is ready."
echo "Use: sudo dnf --enablerepo=local-* install <package>"
