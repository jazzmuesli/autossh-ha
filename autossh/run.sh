#!/usr/bin/env bash

SSH_HOST=$(bashio::config 'ssh_host')
SSH_PORT=$(bashio::config 'ssh_port')
SSH_USER=$(bashio::config 'ssh_user')
REMOTE_PORT=$(bashio::config 'remote_port')
LOCAL_PORT=$(bashio::config 'local_port')
SSH_KEY_PATH=$(bashio::config 'ssh_key_path')

if [ ! -f "$SSH_KEY_PATH" ]; then
    echo "SSH key not found: $SSH_KEY_PATH"
    exit 1
fi

echo "Starting AutoSSH reverse tunnel..."

autossh -M 0 \
  -N \
  -o "ServerAliveInterval 30" \
  -o "ServerAliveCountMax 3" \
  -i "$SSH_KEY_PATH" \
  -R ${REMOTE_PORT}:localhost:${LOCAL_PORT} \
  -p ${SSH_PORT} \
  ${SSH_USER}@${SSH_HOST}
