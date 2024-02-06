#!/bin/bash

# Wait for kubeconfig to be available
while [ ! -f /output/kubeconfig.yaml ]; do
    sleep 1
done

# Set the KUBECONFIG environment variable
export KUBECONFIG=/output/kubeconfig.yaml
echo "export KUBECONFIG=/output/kubeconfig.yaml" >> ~/.bashrc

# Update the cluster hostname in kubeconfig file
sed -i 's/127.0.0.1/server/g' /output/kubeconfig.yaml

# Restrict permissions on kubeconfig file
chmod 600 /output/kubeconfig.yaml

# Start the SSH server
/usr/sbin/sshd -D
