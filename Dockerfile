FROM lscr.io/linuxserver/webtop:ubuntu-xfce

RUN sudo apt-get update
RUN sudo apt-get upgrade
RUN sudo apt-get install -y anki wget zstd xdg-utils nodejs
RUN sudo dpkg --remove anki
RUN sudo wget https://github.com/ankitects/anki/releases/download/2.1.65/anki-2.1.65-linux-qt5.tar.zst
RUN sudo tar --use-compress-program=unzstd -xvf anki-2.1.65-linux-qt5.tar.zst
RUN cd anki-2.1.65-linux-qt5 && sudo ./install.sh 
RUN cd ..
RUN sudo rm -rf anki-2.1.65-linux-qt5 anki-2.1.65-linux-qt5.tar.zst
RUN sudo apt-get clean
RUN mkdir -p /config/.local/share
RUN ln -s /config/Anki /config/.local/share/Anki
RUN ln -s /config/Anki2 /config/.local/share/Anki2
RUN sudo npm install -g npm@9.7.2
RUN sudo npm install -g tiddlywiki


COPY /root /
EXPOSE 3000 3001 8080
VOLUME /config