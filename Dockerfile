FROM ghcr.io/linuxserver/baseimage-rdesktop-web:arch

# set version label
ARG BUILD_DATE
ARG VERSION
ARG XFCE_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
  echo "**** install build deps ****" && \
  pacman -Sy --noconfirm --needed \
    base-devel \
    git && \
  echo "**** build AUR packages ****" && \
  cd /tmp && \
  AUR_PACKAGES="\
    dbus-x11" && \
  pacman -Rns --noconfirm -dd dbus && \
  for PACKAGE in ${AUR_PACKAGES}; do \
    git clone https://aur.archlinux.org/${PACKAGE}.git && \
    chown -R abc:abc ${PACKAGE} && \
    cd ${PACKAGE} && \
    sudo -u abc makepkg -sAci --skipinteg --noconfirm --needed && \
    cd /tmp ;\
  done && \
  echo "**** install packages ****" && \
  pacman -Sy --noconfirm --needed \
    firefox \
    mousepad \
    pavucontrol \
    xfce4 \
    xfce4-pulseaudio-plugin && \
  echo "**** cleanup ****" && \
  pacman -Rsn --noconfirm \
    gcc \
    git \
    $(pacman -Qdtq) && \
  rm -rf \
    /tmp/* \
    /var/cache/pacman/pkg/* \
    /var/lib/pacman/sync/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000
VOLUME /config
