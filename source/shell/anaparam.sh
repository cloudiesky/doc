#!/bin/sh

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



function genseed (){
    if test $1 = "true"; then
        seed=`date +%s%N`
        echo "Random Seed is ${seed}"
    fi
}

function calcNjob(){
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

function getCmd(){
    Ncmd=$(( ($1-1)/$Nrepeat +1 ))
    Cmd=`sed -n "${Ncmd}p" $CmdFile`
}

genseed $RndSeed
calcNjob $CmdFile $Nrepeat
getCmd 20
echo "njob is $Njob"

