#!/bin/bash

git clone https://github.com/ramakrishnakaushik97/mediawiki.git
cd mediawiki
sudo apt install make
make installapp ENV=DEV