#!/bin/bash

echo "Installing dependencies"
pacman -Syu --noconfirm \
    dhcpcd \
    iproute2 \
    plex-media-server

echo "Enabling services"
for svc in dhcpcd plexmediaserver; do
    ln -sf /usr/lib/systemd/system/${svc}.service /etc/systemd/system/multi-user.target.wants/
done

echo "Cleaning up..."
rm -rf /var/cache/pacman/pkg/*
