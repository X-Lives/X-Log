cd "$directory_main/server"

./configure 1
make

if [ ! -h categories ];then
    ln -s "../../${directory_data}/categories" .
fi
if [ ! -h objects ];then
    ln -s "../../${directory_data}/objects" .
fi
if [ ! -h transitions ];then
    ln -s "../../${directory_data}/transitions" .
fi
if [ ! -h tutorialMaps ];then
    ln -s "../../${directory_data}/tutorialMaps" .
fi
if [ ! -h dataVersionNumber.txt ];then
    ln -s "../../${directory_data}/dataVersionNumber.txt" .
fi
