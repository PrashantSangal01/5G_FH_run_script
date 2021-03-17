#!/bin/bash


if [ $# -lt 2 ]
then
	"Usgae: source 5gFH_run.sh dpmac.<1> dpmac.<2>"
	exit
fi

if ls-listni | grep -q 'dprc.2'; then
	echo "dprc.2 exist"

else

	source /usr/local/dpdk/dpaa2/dynamic_dpl.sh $1 $2
	echo "dprc.2 created"
fi

dpni1=`ls-listni | grep $1 | awk '{print $1}'|cut -f3 -d"/"`
dpni2=`ls-listni | grep $2 | awk '{print $1}'|cut -f3 -d"/"`

echo "$dpni1"
echo "$dpni2"

./sample-app ./usecase/$3/config_file_o_$4.dat $dpni1 $dpni2

