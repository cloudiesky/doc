#!/bin/sh

function CMD () {        # 测试命令, 随机等待几秒钟
    n=$((RANDOM % 5 + 1))
    echo $n >> tmp.txt
}

function rand(){
    min=$1
    max=$(($2-$min+1))
    #num=$(($RANDOM+1000000000)) #增加一个10位的数再求余
    num=$(($RANDOM))
    echo $(($num%$max+$min))
}

Nproc=$(rand 50 100)

cat /dev/null > tmp.txt
for((i=1; i<=$Nproc; i++)); do
    CMD
done
