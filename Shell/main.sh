#!/bin/bash

# 1: 硬定义
file_name="main.sh"
file_version="0.0.6-alpha"
file_type="Shell"
file_language_name="${file_name}_language.txt"
file_update_name="${file_name}_latest"
directory_main="X-Lives"
directory_data="X-Data"
directory_minor_gems="X-minorGems"
directory_log="X-Log"
directory_Shell="Shell"
directory_Shell_int="${directory_Shell}.int"
directory_main_v_f="${directory_main}_Version.txt" ## v_f = version_file_name
directory_data_v_f="${directory_data}_Version.txt"
directory_minor_gems_v_f="${directory_minor_gems}_Version.txt"
directory_log_v_f="${directory_log}_Version.txt"
ap_update="-u" ## Additional Parameters
ap2_update="md" ## make_directory
ap3_update_1="l"
ap3_update_2="s"
ap_help="-h"
client_name="X-Lives"
editor_name="X-Editor"
server_name="X-Server"
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
## ANSI Escape Code-给输出的字符串添加颜色
RED='\033[0;31m' # 设置红色
GREEN='\033[0;32m' # 设置绿色
YELLOW='\033[0;33m' # 设置黄色
NC='\033[0m'     # 恢复默认颜色
## Tips
E="[ ${RED}ERROR${NC} ]"
W="[ ${YELLOW}WARNING${NC} ]"
O="[ ${GREEN}OK${NC} ] "
## Choose
use_log="1"

# 2: 软定义
## 语言
if [ ! -e "$file_language_name" ];then
    test1="Choose your language."
    echo "$text1"
    echo "[zh_cn: 1 | en_us: 2]"
    read -p "Enter language number: " language
    echo "$language" >> "$file_language_name"
else
    language=$(cat "$file_language_name")
fi

if [ ! $language = 1 ] && [ ! $language = 2 ] && [ ! $language = $D_En ];then
    echo ""
    echo "Warring: the number[$language] isn't right."
    echo "Choose your language again."
    echo "[zh_cn: 1 | en_us: 2 | zh_tw: 3]"
    read -p "Enter language number [1/2/3]: " language
    if [ -e "$file_language_name" ];then
        rm -f "$file_language_name"
        echo "$language" >> "$file_language_name"
    fi
    if [ ! $language = 1 ] && [ ! $language = 2 ] && [ ! $language = $D_En ];then
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
        while [ ! $language = 1 ] && [ ! $language = 2 ] && [ ! $language = $D_En ]
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
    echo "zh_cn"
    o_1="$O 正确的运行目录。"
    o_2="$O 本次将检查更新。"
    o_3="$O 版本一致。"
    o_4="$O 准备成功，运行主体..."
    o_5="$O 每个编译文件夹版本相同。"
    o_6="$O 本次将所有编译文件更新至最新版本。"
    o_7="$O 本次将所有编译文件更新至指定版本。"
    w_1="$W 不建议的运行目录，请将其移至 $directory_main 等目录同级。"
    w_2="$W 位于未知运行目录，但运行目录为空。"
    w_3="$W 各个编译文件夹版本不一致。"
    w_4="$W 版本号最大相差:"
    w_5="$W 不建议的运行目录，请将其移至 $directory_main 等目录同级。"
    w_6="$W $0 $1 : ${1}=md 但是${3}=?"
    e_1="$E 错误的参数，输入$0 ${ap_help}获取帮助。"
    e_2="$E 该目录不是空目录(${file_name}及产生的数据文件除外)"
    e_3="$E 退出..."
    e_4="$E "
    read_1="下载编译文件至此目录? [Y/n]:"
    read_2="下载最新的 $file_name ? [Y/n]:"
    read_3="下一步执行? [忽略N/更新至最新UL/更新至指定版本US]:" ## neglect/Updated to the latest/Update to specified version
    read_4="输入[${ap3_update_1}/${ap3_update_2} | 默认为${ap3_update_1}]:"
    read_5="键入跳转到的页面[1]:"
    read_6="KEY [获取帮助:$0 ${ap_help}]"
    Server_sh_read_1="键入服务器文件夹名称[server]:"
    tip_1="开始下载..."
    tip_2="版本不一致。"
    tip_3="跳过更新。"
    help_title="HELP"
    h_c="目录"
    h_c_1="附加值帮助页面 --- 1"
    h_c_2="KEY帮助页面 --- 2"
    h_1_1="1. $0 ${ap_help} - 获取帮助"
    h_1_2="2. $0 ${ap_update} 空=${file_name}/${ap2_update} ${ap3_update_1}/${ap3_update_2} - 更新 (后需加参)"
    h_1_2_1="   ${file_name}/不输入 - 检查更新$file_name"
    h_1_2_2="   ${ap2_update} - 更新编译文件夹 (后需加参)"
    h_1_2_2_1="      ${ap3_update_1} - 更新至最新版本"
    h_1_2_2_2="      ${ap3_update_2} - 更新至指定版本"
    h_2_1="1. t1 - 测试编译${client_name}"
    h_2_2="2. t2 - 测试编译${editor_name}"
    h_2_3="3. t3 - 测试编译${server_name}"
    h_2_4="4. t4 - 测试编译ALL"
elif [ $language = 2 ];then
    #en_us
    echo "en_us"
elif [ $language = 3 ];then
    #zh_tw
    echo "zh_tw"
    o_1="$O 正確的運行目錄。"
    o_2="$O 本次將檢查更新。"
    o_3="$O 版本一致。"
    o_4="$O 準備成功，運行主體..."
    o_5="$O 每個編譯文件夾版本相同。"
    o_6="$O 本次將所有編譯文件更新至最新版本。"
    o_7="$O 本次將所有編譯文件更新至指定版本。"
    w_1="$W 不建議的運行目錄，請將其移至 $directory_main 等目錄同級。"
    w_2="$W 位於未知運行目錄，但運行目錄為空。"
    w_3="$W 各個編譯文件夾版本不一致。"
    w_4="$W 版本號最大相差:"
    w_5="$W 不建議的運行目錄，請將其移至 $directory_main 等目錄同級。"
    w_6="$W $0 $1 : ${1}=md 但是${3}=?"
    e_1="$E 錯誤的參數，輸入$0 ${ap_help}獲取幫助。"
    e_2="$E 該目錄不是空目錄(${file_name}及產生的數據文件除外)"
    e_3="$E 退出..."
    e_4="$E "
    read_1="下載編譯文件至此目錄? [Y/n]:"
    read_2="下載最新的 $file_name ? [Y/n]:"
    read_3="下一步執行? [忽略N/更新至最新UL/更新至指定版本US]:" ## neglect/Updated to the latest/Update to specified version
    read_4="輸入[${ap3_update_1}/${ap3_update_2} | 默認為${ap3_update_1}]:"
    read_5="鍵入跳轉到的頁面[1]:"
    read_6="KEY [獲取幫助:$0 ${ap_help}]"
    read_7="选择指定版本号[tag]:"
    tip_1="開始下載..."
    tip_2="版本不一致。"
    tip_3="跳過更新。"
    help_title="HELP"
    h_c="目錄"
    h_c_1="附加值幫助頁面 --- 1"
    h_c_2="KEY幫助頁面 --- 2"
    h_1_1="1. $0 ${ap_help} - 獲取幫助"
    h_1_2="2. $0 ${ap_update} 空=${file_name}/${ap2_update} ${ap3_update_1}/${ap3_update_2} - 更新 (後需加參)"
    h_1_2_1="   ${file_name}/不輸入 - 檢查更新$file_name"
    h_1_2_2="   ${ap2_update} - 更新編譯文件夾 (後需加參)"
    h_1_2_2_1="      ${ap3_update_1} - 更新至最新版本"
    h_1_2_2_2="      ${ap3_update_2} - 更新至指定版本"
    h_2_1="1. t1 - 測試編譯${client_name}"
    h_2_2="2. t2 - 測試編譯${editor_name}"
    h_2_3="3. t3 - 測試編譯${server_name}"
    h_2_4="4. t4 - 測試編譯ALL"
fi
## 参数
if_1=$(echo "$1" | tr '[:upper:]' '[:lower:]')
if_2=$(echo "$2" | tr '[:upper:]' '[:lower:]')
if_3=$(echo "$3" | tr '[:upper:]' '[:lower:]')
if_4=$(echo "$4" | tr '[:upper:]' '[:lower:]')
if [ "$if_1" = "" ];then
    echo ""
elif [ "$if_1" = "$ap_update" ]; then
    if [ "$if_2" = "" ] || [ "$if_2" = "$file_name" ];then
        update_main_sh=true
        echo -e "$o_2"
    elif [ "$if_2" = "$ap2_update" ];then
        if [ "$if_3" = "" ];then
            echo -e "$w_6"
            read -p "$read_4" choose_2
            choose_2-2=$(echo "$choose_2" | tr '[:upper:]' '[:lower:]')
            if [[ "${choose_2-2}" == *"${ap3_update_2}"* ]];then
                update_md_s=true
                echo -e "$o_7"
            else
                update_md_l=true
                echo -e "$o_6"
            fi
        elif [[ "$if_3" == *"${ap3_update_1}"* ]];then
            update_md_l=true
            echo -e "$o_6"
        elif [[ "$if_3" == *"${ap3_update_2}"* ]];then
            update_md_s=true
            echo -e "$o_7"
        else
            echo -e "$e_1"
            exit 1
        fi
    else
        echo -e "$e_1"
        exit 1
    fi
elif [ "$if_1" = "$ap_help" ];then
    hlep_echo=true
else
    echo -e "$e_1"
    exit 1
fi

# 3: 功能
## 检查更新
if [ "$update_main_sh" = "true" ];then
    origin_version=$(curl -L https://raw.githubusercontent.com/X-Lives/X-Log/X/Version/X-main.sh_Version.txt)
    if [ "$origin_version" = "$file_version" ]; then
        echo -e "$o_3"
        echo "origin_version: $origin_version | file_version: $file_version"
    else
        echo "$tip_2"
        echo "origin_version: $origin_version | file_version: $file_version"
        read -p "$read_2" yn_2
        yn_2=$(echo "$yn_2" | tr '[:upper:]' '[:lower:]')
        if [[ "$yn_2" == *y* ]];then
            echo "$tip_1"
            wget -O "$file_update_name" https://raw.githubusercontent.com/X-Lives/X-Log/X/Shell/main.sh
            mv "$file_update_name" "$file_name"
            chmod +x "$file_name"
            exit 0
        else
            echo "$tip_3"
        fi
    fi
fi
## help
first_time=true
while [ "$hlep_echo" == "true" ];do
    if [ $first_time == true ];then
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo ""
        echo "------${help_title}------"
        echo "$h_c"
        echo "$h_c_1"
        echo "$h_c_2"
        echo ""
        ##
        read -p "$read_5" number_1
        if [ $number_1 -eq "1" ];then
            echo ""
            echo "$h_1_1"
            echo "$h_1_2"
            echo "$h_1_2_1"
            echo "$h_1_2_2"
            echo "$h_1_2_2_1"
            echo "$h_1_2_2_2"
        elif [ $number_1 -eq "2" ];then
            echo ""
            echo "$h_2_1"
            echo "$h_2_2"
            echo "$h_2_3"
            echo "$h_2_4"
        fi
        case "$number_1" in
            "e"|"exit") break;;
        esac
        ##
        first_time=false
    else
        read -p "$read_5" number_1
        if [ $number_1 -eq "1" ];then
            echo ""
            echo "$h_1_1"
            echo "$h_1_2"
            echo "$h_1_2_1"
            echo "$h_1_2_2"
            echo "$h_1_2_2_1"
            echo "$h_1_2_2_2"
        elif [ $number_1 -eq "2" ];then
            echo ""
            echo "$h_2_1"
            echo "$h_2_2"
            echo "$h_2_3"
            echo "$h_2_4"
        fi
        case "$number_1" in
            "e"|"exit") break;;
        esac
    fi
done

# 4: 检查
if [ -d "$directory_main" ] && [ -d "$directory_data" ] && [ -d "$directory_minor_gems" ] && [ -d "$directory_log" ];then
    echo -e "$o_1"
elif [ -d "$directory_Shell" ];then
    echo -e "$w_1"
    cd ..
elif [ -e "$directory_Shell_int" ];then
    echo -e "$w_5"
    cd ../..
else
    files=(*)
    if [ ${#files[@]} == 2 ] && [ -e "$file_name" ] && [ -e "$file_language_name" ]; then
        echo -e "$w_2"
        read -p "$read_1" yn_1
        yn_1=$(echo "$yn_1" | tr '[:upper:]' '[:lower:]')
        if [[ $yn_1 == *y* ]];then # [[ $yn_1 == *n* ]] || 
            echo "$tip_1"
            git clone -b "$branch_main" "$rope_main" "$directory_main"
            git clone -b "$branch_data" "$rope_data" "$directory_data"
            git clone -b "$branch_minor_gems" "$rope_minor_gems" "$directory_minor_gems"
            git clone -b "$branch_log" "$rope_log" "$directory_log"
        else
            echo -e "$e_3"
            exit 1
        fi
    else
        echo -e "$e_2"
        exit 1
    fi
fi

# <-插入 功能 update
if [ "$update_md_l" = "true" ];then
    cd "$directory_main"
    git pull --tags
    cd ../"$directory_data"
    git pull --tags
    cd ../"$directory_minor_gems"
    git pull --tags
    cd ../"$directory_log"
    git pull --tags
fi
if [ "$update_md_s" = "true" ];then
    read -p "$read_6" tag
    cd "$directory_main"
    git fetch $rope_main "$tag"
    cd ../"$directory_data"
    git fetch $rope_data "$tag"
    cd ../"$directory_minor_gems"
    git fetch $rope_minor_gems "$tag"
    cd ../"$directory_log"
    git fetch $rope_log "$tag"
fi

cd "$directory_main"
directory_main_v=$(cat "$directory_main_v_f")
cd ..
cd "$directory_data"
directory_data_v=$(cat "$directory_data_v_f")
cd ..
cd "$directory_minor_gems"
directory_minor_gems_v=$(cat "$directory_minor_gems_v_f")
cd ..
cd "$directory_log"
directory_log_v=$(cat "$directory_log_v_f")
cd ..
if [ "$directory_main_v" = "$directory_main_v" ] && [ "$directory_data_v" = "$directory_main_v" ] && [ "$directory_minor_gems_v" = "$directory_main_v" ] && [ "$directory_log_v" = "$directory_main_v" ] && [ ! "$directory_main_v" = "" ]; then
    echo -e "$o_5"
else
    echo -e "$w_3"
    echo "$directory_main = $directory_main_v | $directory_data = $directory_data_v | $directory_minor_gems = $directory_minor_gems_v | $directory_log = $directory_log_v"
    directory_main_v_number=$(($directory_main_v+0))
    directory_data_v_number=$(($directory_data_v+0))
    directory_minor_gems_v_number=$(($directory_minor_gems_v+0))
    directory_log_v_number=$(($directory_log_v+0))
    ## 计算最大值
    max=$directory_main_v_number
    if [ $directory_data_v_number -gt $max ]; then
        max=$directory_data_v_number
    fi
    if [ $directory_minor_gems_v_number -gt $max ]; then
        max=$directory_minor_gems_v_number
    fi
    if [ $directory_log_v_number -gt $max ]; then
        max=$directory_log_v_number
    fi
    ## 计算最小值
    min=$directory_main_v_number
    if [ $directory_data_v_number -lt $min ]; then
        min=$directory_data_v_number
    fi
    if [ $directory_minor_gems_v_number -lt $min ]; then
        min=$directory_minor_gems_v_number
    fi
    if [ $directory_log_v_number -lt $min ]; then
        min=$directory_log_v_number
    fi
    difference=$(($max - $min))
    if [ $difference -le 1 ]; then
        echo -e "${w_4}${difference}"
        read -p "$read_3" choose_1
        
    elif [ $difference -gt 1 ] && [ $difference -le 3 ]; then
        echo -e "${w_4}${difference}"
    else
        echo -e "$e_"
        exit 1
    fi
fi

# 5: 运行
echo -e "$o_4"
echo ""
echo "------------------------"
read -p "$read_6" key
if [ "$key" = "t1" ];then
    cd X-Log/Shell
    chmod +x TestBuildC.sh
    ./TestBuildC.sh
elif [ "$key" = "t2" ];then
    cd X-Log/Shell
    chmod +x TestBuildE.sh
    ./TestBuildE.sh
elif [ "$key" = "t3" ];then
    cd X-Log/Shell
    chmod +x TestBuildS.sh
    ./TestBuildS.sh
elif [ "$key" = "t4" ];then
    cd X-Log/Shell
    chmod +x TestBuildA.sh
    ./TestBuildA.sh
elif [ "$key" = "s1" ];then
    cd X-Log/Shell
    chmod +x Server.sh
    ./Server.sh
elif [ "$key" = "c1" ];then
    cd X-Log/Shell
    chmod +x Clinent_Uni+Yum.sh
    ./Clinent_Uni+Yum.sh
fi