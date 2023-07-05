FROM lscr.io/linuxserver/webtop:ubuntu-xfce

RUN sudo apt-get update
RUN sudo apt-get upgrade
RUN sudo apt-get install -y anki libxcb-xinerama0 libxcb-cursor0 zstd wget
RUN sudo dpkg --remove anki
RUN sudo apt-get install -y libxkbcommon-x11-0 libnss3
RUN sudo wget https://github.com/ankitects/anki/releases/download/2.1.65/anki-2.1.65-linux-qt6.tar.zst
RUN sudo tar --use-compress-program=unzstd -xvf anki-2.1.65-linux-qt6.tar.zst
RUN cd anki-2.1.65-linux-qt6 && sudo ./install.sh

VOLUME "/config"

COPY /root /
EXPOSE 3000 3001 8080