Plex on Arch Linux
==================

This repository contains some options for creating either a straight LXC or Docker container.

Docker
------

To use the Docker version, simply clone this repository and build the image:

    git clone https://github.com/codekoala/docker-plex
    cd docker-plex
    docker build -t plex .

You can then run the container by adding a port forward and mounting a volume
with your video files:

    docker run -d -p 32400:32400 -v /mnt/videos:/videos:ro plex

*CAUTION*: I've not personally tried to actually **view** any media on plex
with such an arrangement. Additional ports may need to be forwarded for that to
work.

LXC
---

To use the LXC version, you must first have LXC operational and also have tools
from packer.io installed.

    git clone https://github.com/codekoala/docker-plex
    cd docker-plex
    packer build packer.json

This may take a minute or two. Once that's done, you'll find a new tarball in
the dist directory. You'll want to extract this tarball to a new container's
rootfs.

    sudo mkdir -p /var/lib/lxc/plex/rootfs
    sudo tar xf ./dist/plex.tar -C /var/lib/lxc/plex/rootfs

Next you'll want to copy the sample lxc configuration file and edit it to suit
your needs.

    sudo cp lxc.config.example /var/lib/lxc/plex/config
    sudo vim /var/lib/lxc/plex/config

In this file, you must replace ``[NAME]`` with the name of your container
(``plex`` in the commands above). You will probably also want to pay attention
to the network configuration and the mounts at the end of the configuration
file.

The sample configuration is set to use a network interface called ``br0``,
which is assumed to be a bridge device, suitable for putting the container
directly onto your network, receiving an IP via DHCP. This makes it easy to
access plex from other devices on your network without having to deal with any
sort of port forwarding.
