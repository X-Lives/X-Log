#!/bin/sh

cd ../..

cd "${directory_data}"
rm */cache.fcz
rm */bin_*cache.fcz

cd "../${directory_main}"
./configure 1

cd gameSource
make

cd ../..
mkdir "${client_name}_${directory_main_v}"
cd "${client_name}_${directory_main_v}"
client_Version=$(cat "../${directory_main}/X-client_Version.txt")
cp -f "../${directory_main}/gameSource/X-Lives" "X-Lives_$client_Version"
if [ ! -e animations ]
then
	cp -rf "../${directory_data}/animations" .	
fi

if [ ! -e categories ]
then
	cp -rf "../${directory_data}/categories" .	
fi

if [ ! -e ground ]
then
	cp -rf "../${directory_data}/ground" .	
fi

if [ ! -e music ]
then
	cp -rf "../${directory_data}/music" .	
fi

if [ ! -e objects ]
then
	cp -rf "../${directory_data}/objects" .	
fi

if [ ! -e sounds ]
then
	cp -rf "../${directory_data}/sounds" .	
fi

if [ ! -e sprites ]
then
	cp -rf "../${directory_data}/sprites" .	
fi

if [ ! -e transitions ]
then
	cp -rf "../${directory_data}/transitions" .	
fi

if [ ! -e dataVersionNumber.txt ]
then
	cp "../${directory_data}/dataVersionNumber.txt" .	
fi

if [ ! -e X-client_Version.txt ]
then
    cp "../${directory_main}/X-client_Version.txt" .
fi

if [ ! -e X-Lives_Version.txt ]
then
    cp "../${directory_main}/X-Lives_Version.txt" .
fi

if [ ! -e X-Data_Version.txt ]
then
    cp "../${directory_main}/X-Data-2_Version.txt" .
fi

cd ..

if [ ! -b OneLife ];then
    git clone -b skps git@github.com:X-Lives/YumLife-Unicode.git OneLife
fi
if [ ! -b minorGems ];then
    git clone -b skps git@github.com:selb/YumLifeMinorGems.git minorGems
fi
cd OneLife
git pull --tags
cd minorGems
git pull --tags

cd OneLife
./configure 1

cd gameSource
make

cd "../../${client_name}_${directory_main_v}"
cp -f ../OneLife/gameSource/OneLife "YumLife+Unicode"