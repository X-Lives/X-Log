#!/bin/bash

source "variables.sh"

cd ../..

# prefix
## SDL lib for linux-windows cross compile
# cd ${directory_bin}

# if [ ! -e SDL-1.2.15 ]
# then
#     wget https://www.libsdl.org/release/SDL-devel-1.2.15-mingw32.tar.gz
#     tar -xvzf SDL-devel-1.2.15-mingw32.tar.gz
#     rm SDL-devel-1.2.15-mingw32.tar.gz
# fi

if [ ! -e SDL ]
then
    ln -s ${directory_bin}/Windows/SDL-1.2.15/include/SDL .
fi
## freetype lib for linux-windows cross compile
# if [ ! -e mingw32 ]
# then
#     wget https://mirror.msys2.org/mingw/mingw32/mingw-w64-i686-freetype-2.13.2-1-any.pkg.tar.zst
#     tar --use-compress-program=unzstd -xvf mingw-w64-i686-freetype-2.13.2-1-any.pkg.tar.zst
#     rm mingw-w64-i686-freetype-2.13.2-1-any.pkg.tar.zst
# fi

if [ ! -e freetype2 ]
then
    ln -s ${directory_bin}/Windows/mingw32/include/freetype2 .
fi

if [ ! -e Winsock.h ]
then
    ln -s /usr/i686-w64-mingw32/include/winsock.h Winsock.h
fi
## other lib for linux-windows cross compile
if [ ! -e libpng16 ]
then
    ln -s ${directory_bin}/Windows/mingw32/include/libpng16 .
fi
if [ ! -e zlib.h ]
then
    ln -s ${directory_bin}/Windows/mingw32/include/zlib.h .
fi

# cp -rf ${directory_bin}/Windows/mingw32/* . 
## Download `X-bin` before 2023/12/16 15:00 to perform compilation, please uncomment this code.
## And comment out the previous code - starting with `if [ ! -e SDL ]`.

cd ${directory_main}

chmod u+x configure
./configure 5
cd gameSource
make
sh makeEditor.sh
sh makeEditor-zh_cn.sh

cd ../..
mkdir ${directory_win}
cd ${directory_win}

cp ../${directory_main}/gameSource/${client_name} .
cp ../${directory_main}/gameSource/${editor_name} .
cp ../${directory_main}/gameSource/${editor_name}-zh_cn .
cp -rf ../${directory_main}/gameSource/graphics .
cp -rf ../${directory_main}/gameSource/languages .
cp -rf ../${directory_main}/gameSource/settings-client settings
cp -rf ../${directory_main}/gameSource/settings-client .
cp -rf ../${directory_main}/gameSource/settings-editor .
cp ../${directory_main}/gameSource/reverbImpulseResponse.aiff .
cp ../${directory_main}/gameSource/wordList.txt .
cp -rf "../${directory_data}/animations" .
cp -rf "../${directory_data}/categories" .
cp -rf "../${directory_data}/ground" .
cp -rf "../${directory_data}/music" .
cp -rf "../${directory_data}/objects" .
cp -rf "../${directory_data}/sounds" .
cp -rf "../${directory_data}/sprites" .
cp -rf "../${directory_data}/transitions" .
cp "../${directory_data}/dataVersionNumber.txt" .
# cp "../${directory_main}/X-client_Version.txt" .
cp "../${directory_main}/${directory_main_v_f}" .
cp "../${directory_data}/${directory_data_v_f}" "${directory_data_2_v_f}"

rm -f settings/email.ini
rm -f settings/accountKey.ini

find . -type f -name '*~' -exec rm {} +

cp ../${directory_main}/scripts/skps2010Scripts/translator.py .
cp ../${directory_main}/scripts/skps2010Scripts/translator.exe .

cp ../${directory_main}/win32/*.dll .

Client_v=$(cat "${directory_main_v_f}")

cd ..

echo -e "${CW_o_1}${Client_v}"

zip -r -q ${client_name}_Windows_v${Client_v}.zip "${directory_win}"

echo -e "${CW_o_2}${Client_v}.zip"
