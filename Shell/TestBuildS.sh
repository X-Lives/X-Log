cd "$directory_main"/gameSource/server

./configure 1
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
