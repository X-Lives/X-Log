# 1: 硬定义
file_name="main.sh"
file_version="0.0.1-alpha"
file_type="Shell"
## D = Directive
D_En="sudo" ### Directive_Enforcement
## ANSI Escape Code-给输出的字符串添加颜色
RED='\033[0;31m' # 设置红色
GREEN='\033[0;32m' # 设置绿色
YELLOW='\033[0;33m' # 设置黄色
NC='\033[0m'     # 恢复默认颜色
## Tips
E="[ ${RED}ERROR${NC} ]"
W="[ ${RED}WARRING${NC} ]"
O="[ ${GREEN}${NC}] "

# 2: 软定义
if [ ! -e "main.sh_version.txt" ];then
    test1="Choose your language."
    echo "$text1"
    echo "[zh_cn: 1 | en_us: 2]"
    read -p "Enter language number: " language
    echo "$language" >> main.sh_version.txt
else
    language=$(cat main.sh_version.txt)
fi
if [ ! $language = 1 ] && [ ! $language = 2 ] && [ ! $language = $D_En ];then
    echo ""
    echo "Warring: the number[$language] isn't right."
    echo "Choose your language again."
    echo "[zh_cn: 1 | en_us: 2]"
    read -p "Enter language number [1/2]: " language
    if [ ! $language = 1 ] && [ ! $language = 2 ] && [ ! $language = $D_En ];then
        echo ""
        echo "what are you doing? The number input is once again incorrect."
        echo "Choose your language again."
        echo "[zh_cn: 1 | en_us: 2]"
        read -p "Enter language number [1/2]: " language
        number="2"
        while [ ! $language = 1 ] && [ ! $language = 2 ] && [ ! $language = $D_En ]
        do
            echo ""
            echo "$number input error."
            echo "Choose your language again."
            echo "[zh_cn: 1 | en_us: 2]"
            echo "Language is not 1, 2, or 3. Continuing loop..."
            read -p "Enter language number [1/2]: " language
            number=$((number + 1))
        done
    fi
fi
if [ $language = $D_En ];then
    language=1
fi
if [ $language = 1 ];then
    # zh_cn
    echo "zh_cn"
    r_1="$O 正确的运行目录。"
    w_1="$W 不建议的运行目录，请将其移至 X-Lives 等目录同级。"
    w_2="$W 位于未知运行目录，但运行目录为空。"
    read_1="下载编译文件至此目录? [Y/n]:"
    s_1="开始下载..."
elif [ $language = 2 ];then
    #en_us
    echo "en_us"
fi

# 3: 检查
if [ -b "X-Lives" ] && [ -b "X-Data" ] && [ -b "X-minorGems" ] && [ -b "X-Log" ];then
    echo "$r_1"
elif [ -b "Version" ];then
    echo "$w_1"
    cd ..
else
    files=$(ls | grep -v "$file_name")
    if [ -z "$files" ];then
        echo "$w_2"
        read -p "$read_1" yn_1
        yn_1=$(echo "$yn_1" | tr '[:upper:]' '[:lower:]')
        if [[ $yn_1 == *y* ]];then # [[ $yn_1 == *n* ]] || 
            echo "$s_1"
        else
            echo "$e_1"
            exit 1
        fi
    else
        exit 1
    fi
fi


# 4: 检查更新
origin_version=$(curl -L -sS https://raw.githubusercontent.com/X-Lives/X-Log/X/README.md)
if [ "$origin_version" = "file_version" ]; then
    echo "$E 已经是最新。"
fi

# 5: 运行
