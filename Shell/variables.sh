#!/bin/bash

# Version: 2.0
# GPL-3
# By: is52hertz

# 1: hard definition | 硬定义
## Choose
use_log="1"
## file
file_name="variables.sh"
main_file_name="main.sh"
file_version="2.0"
main_file_version="0.0.6-alpha"
file_type="variables"
main_file_type="shell"
file_language_name="language.txt"
file_update_name="${file_name}_latest"
main_file_update_name="${main_file_name}_latest"
language_zh_cn="language-zh_cn.sh"
language_en_us="language-en_us.sh"
language_zh_tw="language-zh_tw.sh"
## directory
directory_main="X-Lives"
directory_data="X-Data"
directory_minor_gems="minorGems"
directory_log="X-Log"
directory_Shell="Shell"
directory_Shell_int="${directory_Shell}.int"
directory_main_v_f="${directory_main}_Version.txt" ## v_f = version_file_name
directory_data_v_f="${directory_data}_Version.txt"
directory_minor_gems_v_f="${directory_minor_gems}_Version.txt"
directory_log_v_f="${directory_log}_Version.txt"
## Additional Parameters
ap_update="-u"
ap2_update="md" ## make_directory
ap3_update_1="l"
ap3_update_2="s"
ap_help="-h"
## build
client_name="X-Lives"
editor_name="X-Editor"
server_name="X-Server"
## git
rope_main="git@github.com:X-Lives/X-Lives.git"
rope_data="git@github.com:X-Lives/X-Data.git"
rope_minor_gems="git@github.com:X-Lives/X-minorGems.git"
rope_log="git@github.com:X-Lives/X-Log.git"
branch_main="X"
branch_data="X"
branch_minor_gems="X"
branch_log="X"
## D = Directive
D_En="sudo" ### Directive_Enforcement
## ANSI Escape Code | 给输出的字符串添加颜色
RED='\033[0;31m' # Set red | 设置红色
GREEN='\033[0;32m' # Set green | 设置绿色
YELLOW='\033[0;33m' # Set yellow | 设置黄色
NC='\033[0m'     # Restore default colors | 恢复默认颜色
## Tips
E="[ ${RED}ERROR${NC} ]"
W="[ ${YELLOW}WARNING${NC} ]"
O="[ ${GREEN}OK${NC} ] "

# 2: soft definition | 软定义
## language | 语言
if [ ! -e "$file_language_name" ];then
    test1="Choose your language."
    echo "$text1"
    echo "[zh_cn: 1 | en_us: 2]"
    read -p "Enter language number: " language
    echo "$language" >> "$file_language_name"
else
    language=$(cat "$file_language_name")
fi

if [ ! $language = 1 ] && [ ! $language = 2 ] && [ ! $language = 3 ] && [ ! $language = $D_En ];then
    echo ""
    echo "Warring: the number[$language] isn't right."
    echo "Choose your language again."
    echo "[zh_cn: 1 | en_us: 2 | zh_tw: 3]"
    read -p "Enter language number [1/2/3]: " language
    if [ -e "$file_language_name" ];then
        rm -f "$file_language_name"
        echo "$language" >> "$file_language_name"
    fi
    if [ ! $language = 1 ] && [ ! $language = 2 ] && [ ! $language = 3 ] && [ ! $language = $D_En ];then
        echo ""
        echo "what are you doing? The number input is once again incorrect."
        echo "Choose your language again."
        echo "[zh_cn: 1 | en_us: 2 | zh_tw: 3]"
        read -p "Enter language number [1/2/3]: " language
        if [ -e "$file_language_name" ];then
            rm -f "$file_language_name"
            echo "$language" >> "$file_language_name"
        fi
        number="2"
        while [ ! $language = 1 ] && [ ! $language = 2 ] && [ ! $language = 3 ] && [ ! $language = $D_En ]
        do
            echo ""
            echo "$number input error."
            echo "Choose your language again."
            echo "[zh_cn: 1 | en_us: 2 | zh_tw: 3]"
            echo "Language is not 1, 2, or 3. Continuing loop..."
            read -p "Enter language number [1/2/3]: " language
            number=$((number + 1))
            if [ -e "$file_language_name" ];then
                rm -f "$file_language_name"
                echo "$language" >> "$file_language_name"
            fi
        done
    fi
fi

if [ $language = "$D_En" ];then
    language=1
fi
if [ $language = 1 ];then
    # zh_cn
    source "${language_zh_cn}"
elif [ $language = 2 ];then
    #en_us
    source "${language_en_us}"
elif [ $language = 3 ];then
    #zh_tw
    source "${language_zh_tw}"
fi
