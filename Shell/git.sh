#!/bin/bash

source "variables.sh"

git_sh_if_1=$(echo "$1" | tr '[:upper:]' '[:lower:]')
if [ "$git_sh_if_1" = "-beta" ];then
    use_beta_commit=1
else
    echo .
fi
echo " 1 --- git pull all. "
# echo " 2 --- git push all. "
echo " 3 --- git push choose. "
read -p "KEY[1-2]:" do
cd ../..

cd "${directory_main}"

cd ..

cd "${directory_data}"

cd ..

cd "${directory_minor_gems}"

cd ..

cd "${directory_log}"

if [ "$do" = "1" ];then
    cd "${directory_main}"
    git pull
    cd ..
    git pull
    cd "${directory_data}"
    git pull
    cd ..
    git pull
    cd "${directory_minor_gems}"
    git pull
    cd ..
    git pull
    cd "${directory_log}"
    git pull
    cd ..
    cd "${directory_bin}"
    git pull
    cd ..
elif [ "$do" = "3" ];then
    read -p "directory" git_sh_directory
    cd "${git_sh_directory}"
    echo "Windows : \ | Linux : /"
    read -p "git add <text> | [Enter] = ." git_sh_addtext
    if [ ${git_sh_addtext} = "" ] && [ ${git_sh_addtext} = "." ];then
        git add .
    else
        while [ ! "${git_sh_addtext}" = "" ] && [ ! "${git_sh_addtext}" = "exit" ]
        do
            read -p "git add <text> | [Enter] = exit" git_sh_addtext
            git add "${git_sh_addtext}"
        done
    fi
    read -p "will commit [Y/n]" git_sh_read
    if_git_sh_read=$(echo "$git_sh_read" | tr '[:upper:]' '[:lower:]')
    if [ "${if_git_sh_read}" == *y* ];then
        if [ "${use_beta_commit}" = "1" ];then
            read -p "Submission format using X ? [Y/n]" git_sh_read_2
            if_git_sh_read_2=$(echo "$git_sh_read_2" | tr '[:upper:]' '[:lower:]')
            if [ "${if_git_sh_read_2}" == *y* ];then
                git_sh_number=0
                while []
                do
                    git_sh_number=$((git_sh_number + 1))
                    read -p "Message: " 
                done
            else
                # wait
            fi
        else
            git commit
        fi
    fi
        exit 1
    fi
fi