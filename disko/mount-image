#!/usr/bin/env bash
set -ue
PARTLISTFILE=$( mktemp )
trap 'rm "${PARTLISTFILE}"' EXIT

function make_part_list() {
	local PARTFLAG=0
	LANG=C fdisk -l ${IMAGEFILE} | while read LINE ; do
		CHECK=$( echo -e "${LINE}" | grep '^Device' | wc -l )
		if [ ${CHECK} -ne 0 ] ; then
			PARTFLAG=1
			continue
		fi
		if [ ${PARTFLAG} -ne 0 ] ; then
			echo -e "${LINE}" >> ${PARTLISTFILE}
		fi
	done
}

NUM_OF_VARS=$#
DISPLAYPARTLISTONLY=0

if [ ${NUM_OF_VARS} -ne 3 ] ; then
	if [ ${NUM_OF_VARS} -ne 1 ] ; then
		echo "usage: ${0} <imagefile> [<part-num> <mount-point>]"
		exit 1
	else
		DISPLAYPARTLISTONLY=1
	fi
fi

IMAGEFILE=${1}
if [ ! -f "${IMAGEFILE}" ] ; then
	echo "no imagefile: ${IMAGEFILE}"
	exit 1
fi

make_part_list
## display partition list if only image-file is set.
if [ ${DISPLAYPARTLISTONLY} -ne 0 ] ; then
	cat ${PARTLISTFILE}
	exit 0
fi

PARTNUM=${2}
if [[ "${PARTNUM}" =~ ^[1-9][0-9]*$ ]]; then
	:
else
	echo "invalid partition number: ${PARTNUM}"
	exit 1
fi
MOUNTPOINT=${3}
if [ ! -d "${MOUNTPOINT}" ] ; then
	echo "no mount-point: ${MOUNTPOINT}"
	exit 1
fi

## mount partition from imagefile
if [ ${EUID:-${UID}} -ne 0 ] ; then
	echo 'Please run as root to mount.'
	exit 1
fi

OFFSET=0
MOUNTED=0
COUNT=$(( 1 ))
while read LINE ; do
	echo "${LINE}"
	if [ ${COUNT} -eq ${PARTNUM} ] ; then
		STARTSEC=$( echo "${LINE}" | tr -d '*' | sed -E 's/\s+/ /g' | cut -d ' ' -f 2 )
		OFFSET=$(( ${STARTSEC} * 512 ))
		EXEC="mount -o loop,offset=${OFFSET} ${IMAGEFILE} ${MOUNTPOINT}"
		echo ">> ${EXEC}"
		${EXEC}
		## if mount is error, this script is stopped at mount.
		MOUNTED=1
	fi
	COUNT=$(( ${COUNT} + 1 ))
done < ${PARTLISTFILE}

## result
if [ "${MOUNTED}" -ne "0" ]; then
	echo ""
	echo "${MOUNTPOINT}"
	ls -la ${MOUNTPOINT}
	echo ""
	echo "partition ${PARTNUM} is mounted on ${MOUNTPOINT}, remember umount when you're done to use."
else
	echo "no partition ${PARTNUM}."
	exit 1
fi
exit 0
