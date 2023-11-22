#!/bin/bash

source "variables.sh"

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
