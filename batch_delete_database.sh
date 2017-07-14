# !/bin/bash


REG=${1}
if [[ ${REG} == "" ]]; then
    echo "please input the database name regex";
    exit 1 
fi
FILE="database.txt"

mysql -h172.22.144.33 -uroot -padmin -e "show databases;" >${FILE}

# 读取每一个数据库名称
cat file ${FILE} | while read line
do
    if [[ ${line} == ${REG} ]]; then
        # echo ${line}_contain
        mysql -h172.22.144.33 -uroot -padmin -e "drop database ${line};" >/dev/null 2>&1  
        test $? != 0 && echo "database connect failed" && exit -1
        echo "drop database ${line} success!"
    else
        echo ${line}_not_contain

    fi
done

rm -rf ${FILE}
