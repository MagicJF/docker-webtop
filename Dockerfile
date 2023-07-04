FROM magicjf/anki

#   apt-get update && \
#   apt-get install -y anki wget zstd xdg-utils && \
#   dpkg --remove anki && \
#   wget https://github.com/ankitects/anki/releases/download/2.1.65/anki-2.1.65-linux-qt5.tar.zst && \
#   tar --use-compress-program=unzstd -xvf anki-2.1.65-linux-qt5.tar.zst && \
#   cd anki-2.1.65-linux-qt5 && ./install.sh &&  cd .. && \
#   rm -rf anki-2.1.65-linux-qt5 anki-2.1.65-linux-qt5.tar.zst && \
#   apt-get clean && \
#   mkdir -p /config/.local/share && \
#   ln -s /config/app/Anki  /config/.local/share/Anki  && \
#   ln -s /config/app/Anki2 /config/.local/share/Anki2


COPY /root /
EXPOSE 3000 3001 8080
VOLUME /config