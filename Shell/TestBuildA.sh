#!/bin/sh
directory_data="X-Data"
directory_main="X-Lives"

cd ../..

cd "${directory_data}"
rm */cache.fcz
rm */bin_*cache.fcz

cd "../${directory_main}"
chmod u+x ./configure
./configure 1 || exit 1

cd gameSource
make || exit 1

sh makeEditor.sh
sh makeEditor-zh_cn.sh

if [ ! -h animations ]
then
	ln -s "../../${directory_data}/animations" .	
fi

if [ ! -h categories ]
then
	ln -s "../../${directory_data}/categories" .	
fi

if [ ! -h ground ]
then
	ln -s "../../${directory_data}/ground" .	
fi

if [ ! -h music ]
then
	ln -s "../../${directory_data}/music" .	
fi

if [ ! -h objects ]
then
	ln -s "../../${directory_data}/objects" .	
fi

if [ ! -h sounds ]
then
	ln -s "../../${directory_data}/sounds" .	
fi

if [ ! -h sprites ]
then
	ln -s "../../${directory_data}/sprites" .	
fi

if [ ! -h transitions ]
then
	ln -s "../../${directory_data}/transitions" .	
fi

if [ ! -h dataVersionNumber.txt ]
then
	ln -s "../../${directory_data}/dataVersionNumber.txt" .	
fi

if [ ! -h overlays ]
then
    ln -s "../../${directory_data}/overlays" .
fi

if [ ! -h scenes ]
then
    ln -s "../../${directory_data}/scenes" .
fi

echo 1 > settings/useCustomServer.ini
echo test@test.com > settings/email.ini
echo testPassword > settings/accountKey.ini

cd ../server

chmod u+x ./configure
./configure 1 || exit 1
make

if [ ! -h categories ];then
    ln -s ../../OneLifeData7/categories .
fi
if [ ! -h objects ];then
    ln -s ../../OneLifeData7/objects .
fi
if [ ! -h transitions ];then
    ln -s ../../OneLifeData7/transitions .
fi
if [ ! -h tutorialMaps ];then
    ln -s ../../OneLifeData7/tutorialMaps .
fi
if [ ! -h dataVersionNumber.txt ];then
    ln -s ../../OneLifeData7/dataVersionNumber.txt .
fi

echo 0 > settings/requireTicketServerCheck.ini
echo 1 > settings/forceEveLocation.ini