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
echo "Je recrée le dossier THEOS"
sudo mkdir -p $THEOS
# echo "export THEOS=/opt/theos" >> ~/.bash_profile
echo "Je télécharge THEOS..."
sudo git clone git://github.com/DHowett/theos.git $THEOS

echo "On télécharge les headers"
cd $THEOS/include
#open .
#echo -e "\nEn attente des headers...\n"
#read -n 1 -s
sudo git clone git://github.com/rpetrich/iphoneheaders.git $THEOS/include/rpetrich
sudo mv $THEOS/include/rpetrich/* $THEOS/include/
sudo rmdir $THEOS/include/rpetrich

for aFile in ~/.include.bk/*.h; do sudo mv $aFile $THEOS/include/; done
sudo rmdir ~/.include.bk/

echo "On prend le header IOSurfaceAPI..."
cd $THEOS/include/IOSurface
sudo wget https://raw.github.com/javacom/toolchain4/master/Projects/IOSurfaceAPI.h

echo "Je télécharge 'ldid'"
#cd $THEOS/bin
#sudo git clone git://git.saurik.com/ldid.git
#cd ldid
#sudo git submodule update --init
#sudo ./make.sh
#sudo cp -f ./ldid $THEOS/bin/ldid
#sudo chmod 755 $THEOS/bin/ldid
brew install ldid

#echo "On va se connecter à l'iPhone maintenant..."
#echo "On va pouvoir récupérer 'CydiaSubstrate' qui est sur ton iPhone :"
#sudo scp root@$ip_address:/Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate $THEOS/lib
#echo "Il faut aussi copier le header substrate.h :"
#sudo scp root@$ip_address:/Library/Frameworks/CydiaSubstrate.framework/Headers/CydiaSubstrate.h $THEOS/include/substrate.h

cd $THEOS
echo "ARM64 -> Substrate update"
sudo wget http://apt.saurik.com/debs/mobilesubstrate_0.9.6011_iphoneos-arm.deb
sudo mkdir substrate
sudo dpkg-deb -x dpkg-deb -x mobilesubstrate_*_iphoneos-arm.deb substrate
sudo cp substrate/Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate $THEOS/lib/libsubstrate.dylib
sudo cp substrate/Library/Frameworks/CydiaSubstrate.framework/Headers/CydiaSubstrate.h $THEOS/include/substrate.h

echo "Installing Flipswitch librairies"
echo "YOU NEED FLIPSWITCH ON YOUR DEVICE"
git clone https://github.com/a3tweaks/Flipswitch.git /tmp/Flipswitch
sudo mv /tmp/Flipswitch/public $THOS/include/flipswitch
rm -rf /tmp/Flipswitch
#echo "Pulling Flipswitch from your iPhone"
#sudo scp root@$ip_address:/usr/lib/libflipswitch.dylib $THEOS/lib/

exit 0
