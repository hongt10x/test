#!/bin/bash

#date: 2020/9/15
#first test

function parse_args()
{

    while getopts ":d:n:i:h:l:s:p:" OPTION; do	#第一个：可以忽略错误
        case $OPTION in
            d)
                d="${OPTARG}"
                echo "d:$OPTIND"
				;;
            n)
               	n="${OPTARG}I"
				echo "n:$OPTIND"
               	;;
            i)
               	i="${OPTARG}"
               	;;
            l)
               	l="${OPTARG}"
               	;;
            s)
               	s="${OPTARG}"
               	;;
            p)
               	p="${OPTARG}"
               	;;
            h)
               	echo "help"
               	#exit -1
               	;;
            ?)
                echo "bye"
                #exit -1
                ;;
        esac
    done
    return 0
}

#parse_args "$@" #输入参数加双引号后，所有参数都是独立的
#parse_args "$*" #输入参数加双引号后，所有参数被当作一个字符串处理

parse_args $@
echo $@
echo "----------------------" 
echo $OPTIND
shift $(($OPTIND-1))  #清除所有输入参数
echo $0
echo $OPTIND
echo $*

#./test.sh -d -d 33 -n 99  (认为只有一个-d，所以获取到d后的OPTIND=3)

#./test.sh -d 33 -d -n 99  (认为有2个-d，所以获取到d后的OPTIND=5)




function parse_args1()
{

    while getopts ":a:b:" OPTION; do	#第一个：可以忽略错误
        case $OPTION in
            a)
                echo "a:$OPTARG - $OPTIND"
				;;
            b)
				echo "b:$OPTARG - $OPTIND"
               	;;
            ?)
                echo "---Not exist.---"
                #exit -1
				echo "?:$OPTARG - $OPTIND"
                ;;
        esac
    done
    return 0
}

parse_args1 "$@" #所有参数都是独立的

parse_args1 "$*" #所有参数被当作一个字符串处理

echo $@
echo $*
echo "---------"
echo "$@" 
echo "$*"



#!/bin/bash


script_name="$(bashname $0)"

help_show()
{
	echo -e "
	w: week	(20WW13)
	n: build number  (2020_1234)	
	b: branch	(stable/master)
	
	eg: ./$script_name -w 20WW13 -n 2020_1234 -b stable\n"
	exit -1
}

function get_args()
{
	while getopts ":w:n:b:" option
	do
	
		case $option in
		w)
			w=`echo $OPTARG |tr "a-z" "A-Z"`
			echo "w: $w"
			;;
		n)
			n=$OPTARG
			echo "n: $n"
			;;
		b)
			b=`echo $OPTARG |tr "A-Z" "a-z"`
			echo "b: $b"
			;;
		h)
			help_show
			;;
		?)
			help_show
			;;
			
		esac
	
	done
}

if [ $# -eq 0 ];then
	help_show
fi

get_args $*



