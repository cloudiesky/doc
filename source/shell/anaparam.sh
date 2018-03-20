#!/bin/bash

Nproc=1
CmdFile=""
RndSeed=false
Nrepeat=1
seed=1
Njob=1

while getopts ":n:r:f:s" opt ; do
    case $opt in
        n)
            Nproc=$OPTARG
            ;;
        f)
            CmdFile=$OPTARG
            ;;
        s)
            RndSeed=true
            ;;
        r)
            Nrepeat=$OPTARG
            ;;
        '?')
        ;;
    esac
done
shift $((OPTIND -1))

echo $Nproc
echo $CmdFile
echo $RndSeed
echo $Nrepeat

function genseed () {
    if test $RndSeed = "true"
    then
        eval seed$1=`date +%s%N`
        echo "Random Seed is `eval echo '$'seed$1`"
    fi
}

function calcNjob() {
    if test $1 = ""
    then
        echo "No Command File."
        exit
    elif [ ! -s "$1" ]
    then
        echo "Command File $1 is empty"
    else
        Nline=`cat $1 | wc -l`
        #Nline=`sed -n '$=' $1`
        echo "Comand file $1 has $Nline lines"
    fi
    Njob=$(( $Nline * $2 ))
}

function getCmd() {
    Ncmd=$(( ($1-1)/$Nrepeat +1 ))
    Cmd=`sed -n "${Ncmd}p" $CmdFile`
}




function CMD () {        # 测试命令, 随机等待几秒钟
    echo "Job ${1}/${Njob} Start"
    genseed $1
    getCmd $1
    Cmd="$Cmd SEED=`eval echo '$'seed$1`"
    n=$(( `eval echo '$'seed$1` % 5 + 1))
    echo "Job $1 Ijob $2 sleeping for $n seconds ..." $Cmd
    sleep $n
    echo "Job $1 Ijob $2 exiting ..."
}

calcNjob $CmdFile $Nrepeat

Pfifo="/tmp/$$.fifo"
mkfifo $Pfifo
exec 6<>$Pfifo
rm -f $Pfifo
for((i=1; i<=$Nproc; i++)); do
    echo
done >&6

for((i=1; i<=$Njob; i++)); do
    read -u6
    {
        CMD $i && {
            echo "Job ${i}/${Njob} finished"
        } || {
            echo "Job ${i}/${Njob} error"
        }
        sleep 1
        echo >&6 &
    } &
done
wait
exec 6>&-
