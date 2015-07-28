FROM codekoala/arch
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

CMD ["/opt/plexmediaserver/Plex Media Server"]
EXPOSE 32400
ENV LD_LIBRARY_PATH=/opt/plexmediaserver \
    PLEX_MEDIA_SERVER_HOME=/opt/plexmediaserver \
    PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/var/lib/plex \
    PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6 \
    PLEX_MEDIA_SERVER_TMPDIR=/tmp \
    TMPDIR=/tmp

RUN pacman -Sqyu --noconfirm --needed plex-media-server

USER plex
