#!/bin/bash

/usr/bin/xfce4-session  > /dev/null 2>&1 & \ 
# /usr/bin/xfce4-terminal --command "firefox" & \ 
/usr/bin/xfce4-terminal --command "anki" & \ 
/usr/bin/xfce4-terminal --command "tiddlywiki mynewwiki --init server" & \ 
/usr/bin/xfce4-terminal --command "tiddlywiki mynewwiki --listen"