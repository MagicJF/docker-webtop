FROM lscr.io/linuxserver/webtop:ubuntu-xfce

RUN sudo apt-get update
RUN sudo apt-get upgrade
<<<<<<< HEAD
RUN sudo apt-get install -y anki libxcb-xinerama0 libxcb-cursor0 zstd wget nodejs
=======
RUN sudo apt-get install -y anki libxcb-xinerama0 libxcb-cursor0 zstd wget
>>>>>>> d5471faaae20655df02926e9f5104c8eae7f3bec
RUN sudo dpkg --remove anki
RUN sudo apt-get install -y libxkbcommon-x11-0 libnss3
RUN sudo wget https://github.com/ankitects/anki/releases/download/2.1.65/anki-2.1.65-linux-qt6.tar.zst
RUN sudo tar --use-compress-program=unzstd -xvf anki-2.1.65-linux-qt6.tar.zst
RUN cd anki-2.1.65-linux-qt6 && sudo ./install.sh
<<<<<<< HEAD
RUN cd ..
RUN sudo rm -rf anki-2.1.65-linux-qt5 anki-2.1.65-linux-qt5.tar.zst
RUN sudo apt-get clean

RUN sudo npm install -g npm@9.7.2
RUN sudo npm install -g tiddlywiki
=======
>>>>>>> d5471faaae20655df02926e9f5104c8eae7f3bec

VOLUME "/config"

COPY /root /
<<<<<<< HEAD
EXPOSE 3000 3001 8080
=======
EXPOSE 3000 3001 8080
>>>>>>> d5471faaae20655df02926e9f5104c8eae7f3bec
