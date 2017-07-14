# !/bin/bash

function convert() {
    BK="create database ${1}_bk character set utf8mb4 collate utf8mb4_bin;"
    USE_DATABASE="use ${1};"
    MODIFY_REGION="alter table region add listOrder int default 0;"
    MODIFY_MODELGROUP="alter table model_group add level_order int default 0;"
    mysql -uroot -padmin ${1} -e "${USE_DATABASE};${BK};${MODIFY_REGION};${MODIFY_MODELGROUP}" >/dev/null 2>$1
    test $? != 0 && echo "database connect failed" && exit -1
   
    echo "success!"
}
convert ${1}
