FROM archlinux:base-devel
LABEL org.opencontainers.image.description="CachyOS - Arch-based distribution offering an easy installation, several customizations, and unique performance optimization."

RUN  pacman -Syu --noconfirm && \
     pacman -S --needed --noconfirm pacman-contrib git openssh sudo curl 
COPY pacman.conf /etc/pacman.conf 
RUN  curl https://raw.githubusercontent.com/CachyOS/CachyOS-PKGBUILDS/master/cachyos-mirrorlist/cachyos-mirrorlist -o /etc/pacman.d/cachyos-mirrorlist


## include to pacman own keyring to install signed packages
RUN  pacman-key --init && \
     pacman-key --recv-keys F3B607488DB35A47 --keyserver keyserver.ubuntu.com && \
     pacman-key --lsign-key F3B607488DB35A47 && \
     pacman -Sy && \
	 pacman -S --needed --noconfirm cachyos-keyring cachyos-mirrorlist cachyos-v3-mirrorlist cachyos-v4-mirrorlist cachyos-hooks && \
	 pacman -Syu --noconfirm
