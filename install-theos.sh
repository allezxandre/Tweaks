#!/bin/bash
set -euo pipefail

clear
echo -e "\nSalut :)\n"
export THEOS=/opt/theos

while true; do
      read -sn 1 -p "Supprimer tous les includes déjà présents ? [o/n]" ouinon
      case $ouinon in
         [OoYy]* ) sudo rm -rf /opt/theos/include/; break;;
         [Nn]* ) echo "OK :/"; break;;
         * ) echo "Réponds avec 'O' (pour oui) ou 'N' (pour non)";;
      esac
done

while true; do
      read -sn 1 -p "Je vais supprimer toutes les merdes dans /opt/theos. On continue ? [o/n]" ouinon
      case $ouinon in
         [OoYy]* ) sudo mv $THEOS/include ~/.include.bk || echo "Le dossier THEOS=$THEOS est vide"; sudo rm -r /opt/theos || echo "Rien à supprimer"; break;;
         [Nn]* ) exit;;
         * ) echo "Réponds avec 'O' (pour oui) ou 'N' (pour non)";;
      esac
done
#read -p "Quelle est l'addresse IP de l'iPhone ? " ip_address
#echo "Adresse IP de l'iPhone : $ip_address"

# https://github.com/theos/theos/wiki/Installation#prerequisites
brew install dpkg ldid
brew install --HEAD hbang/repo/deviceconsole  # (not required, but very useful)

echo "Je recrée le dossier THEOS"
sudo mkdir -p $THEOS
sudo chown $(id -u):$(id -g) $THEOS

echo "Je télécharge THEOS dans le dossier ${THEOS}..."
git clone --recursive https://github.com/theos/theos.git $THEOS

echo "Voilà ! Theos est installé !"
exit 0
