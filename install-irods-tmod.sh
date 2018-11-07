#!/bin/bash

MODULEDIR="$HOME/privatemodules"
SOFTWAREDIR="$HOME/software"

MODULE_NAME="irods"
MODULE_VERSION="4.2.4"
MODULE_PATH="$SOFTWAREDIR/$MODULE_NAME/$MODULE_VERSION"

# verify Singularity image
SIMG_FILE="irods.simg"
SIMG_PATH="$SIMG_FILE"

if [[ ! -f $SIMG_PATH ]]; then
	echo "error: could not find $SIMG_PATH"
	exit -1
fi

# move Singularity image to module path
rm -rf $MODULE_PATH
mkdir -p $MODULE_PATH

ln $SIMG_PATH $MODULE_PATH

# create modulefile
mkdir -p $MODULEDIR/$MODULE_NAME

cat > "$MODULEDIR/$MODULE_NAME/$MODULE_VERSION" <<EOF
#%Module1.0
##
## $MODULE_NAME/$MODULE_VERSION  modulefile
##
module-whatis "Set up environment for $MODULE_NAME"
module add singularity

# for Tcl script use only
set version "3.2.6"

# Make sure no other hpc modulefiles are loaded before loading this module
eval set [ array get env MODULESHOME ]

set-alias iadmin       "singularity exec $MODULE_PATH/$SIMG_FILE iadmin"
set-alias ibun         "singularity exec $MODULE_PATH/$SIMG_FILE ibun"
set-alias icd          "singularity exec $MODULE_PATH/$SIMG_FILE icd"
set-alias ichksum      "singularity exec $MODULE_PATH/$SIMG_FILE ichksum"
set-alias ichmod       "singularity exec $MODULE_PATH/$SIMG_FILE ichmod"
set-alias icp          "singularity exec $MODULE_PATH/$SIMG_FILE icp"
set-alias ienv         "singularity exec $MODULE_PATH/$SIMG_FILE ienv"
set-alias ierror       "singularity exec $MODULE_PATH/$SIMG_FILE ierror"
set-alias iexecmd      "singularity exec $MODULE_PATH/$SIMG_FILE iexecmd"
set-alias iexit        "singularity exec $MODULE_PATH/$SIMG_FILE iexit"
set-alias ifsck        "singularity exec $MODULE_PATH/$SIMG_FILE ifsck"
set-alias iget         "singularity exec $MODULE_PATH/$SIMG_FILE iget"
set-alias igroupadmin  "singularity exec $MODULE_PATH/$SIMG_FILE igroupadmin"
set-alias ihelp        "singularity exec $MODULE_PATH/$SIMG_FILE ihelp"
set-alias iinit        "singularity exec $MODULE_PATH/$SIMG_FILE iinit"
set-alias ils          "singularity exec $MODULE_PATH/$SIMG_FILE ils"
set-alias ilsresc      "singularity exec $MODULE_PATH/$SIMG_FILE ilsresc"
set-alias imcoll       "singularity exec $MODULE_PATH/$SIMG_FILE imcoll"
set-alias imeta        "singularity exec $MODULE_PATH/$SIMG_FILE imeta"
set-alias imiscsvrinfo "singularity exec $MODULE_PATH/$SIMG_FILE imiscsvrinfo"
set-alias imkdir       "singularity exec $MODULE_PATH/$SIMG_FILE imkdir"
set-alias imv          "singularity exec $MODULE_PATH/$SIMG_FILE imv"
set-alias ipasswd      "singularity exec $MODULE_PATH/$SIMG_FILE ipasswd"
set-alias iphybun      "singularity exec $MODULE_PATH/$SIMG_FILE iphybun"
set-alias iphymv       "singularity exec $MODULE_PATH/$SIMG_FILE iphymv"
set-alias ips          "singularity exec $MODULE_PATH/$SIMG_FILE ips"
set-alias iput         "singularity exec $MODULE_PATH/$SIMG_FILE iput"
set-alias ipwd         "singularity exec $MODULE_PATH/$SIMG_FILE ipwd"
set-alias iqdel        "singularity exec $MODULE_PATH/$SIMG_FILE iqdel"
set-alias iqmod        "singularity exec $MODULE_PATH/$SIMG_FILE iqmod"
set-alias iqstat       "singularity exec $MODULE_PATH/$SIMG_FILE iqstat"
set-alias iquest       "singularity exec $MODULE_PATH/$SIMG_FILE iquest"
set-alias iquota       "singularity exec $MODULE_PATH/$SIMG_FILE iquota"
set-alias ireg         "singularity exec $MODULE_PATH/$SIMG_FILE ireg"
set-alias irepl        "singularity exec $MODULE_PATH/$SIMG_FILE irepl"
set-alias irm          "singularity exec $MODULE_PATH/$SIMG_FILE irm"
set-alias irmtrash     "singularity exec $MODULE_PATH/$SIMG_FILE irmtrash"
set-alias irsync       "singularity exec $MODULE_PATH/$SIMG_FILE irsync"
set-alias irule        "singularity exec $MODULE_PATH/$SIMG_FILE irule"
set-alias iscan        "singularity exec $MODULE_PATH/$SIMG_FILE iscan"
set-alias isysmeta     "singularity exec $MODULE_PATH/$SIMG_FILE isysmeta"
set-alias iticket      "singularity exec $MODULE_PATH/$SIMG_FILE iticket"
set-alias itrim        "singularity exec $MODULE_PATH/$SIMG_FILE itrim"
set-alias iuserinfo    "singularity exec $MODULE_PATH/$SIMG_FILE iuserinfo"
set-alias ixmsg        "singularity exec $MODULE_PATH/$SIMG_FILE ixmsg"
set-alias izonereport  "singularity exec $MODULE_PATH/$SIMG_FILE izonereport"
EOF

