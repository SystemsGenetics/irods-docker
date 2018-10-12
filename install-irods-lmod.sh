#!/bin/bash

MODULEDIR="$HOME/privatemodules"
SOFTWAREDIR="$HOME/software"

MODULE_NAME="irods"
MODULE_VERSION="4.2.0"
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
help([[
    iRODS Version 4.2.0
    For more information on a particular icommand:
     '<icommand> -h'
    or
     'ihelp <icommand>'
]])

prereq("singularity")

set_alias("iadmin",       "singularity exec $MODULE_PATH/$SIMG_FILE iadmin")
set_alias("ibun",         "singularity exec $MODULE_PATH/$SIMG_FILE ibun")
set_alias("icd",          "singularity exec $MODULE_PATH/$SIMG_FILE icd")
set_alias("ichksum",      "singularity exec $MODULE_PATH/$SIMG_FILE ichksum")
set_alias("ichmod",       "singularity exec $MODULE_PATH/$SIMG_FILE ichmod")
set_alias("icp",          "singularity exec $MODULE_PATH/$SIMG_FILE icp")
set_alias("ienv",         "singularity exec $MODULE_PATH/$SIMG_FILE ienv")
set_alias("ierror",       "singularity exec $MODULE_PATH/$SIMG_FILE ierror")
set_alias("iexecmd",      "singularity exec $MODULE_PATH/$SIMG_FILE iexecmd")
set_alias("iexit",        "singularity exec $MODULE_PATH/$SIMG_FILE iexit")
set_alias("ifsck",        "singularity exec $MODULE_PATH/$SIMG_FILE ifsck")
set_alias("iget",         "singularity exec $MODULE_PATH/$SIMG_FILE iget")
set_alias("igroupadmin",  "singularity exec $MODULE_PATH/$SIMG_FILE igroupadmin")
set_alias("ihelp",        "singularity exec $MODULE_PATH/$SIMG_FILE ihelp")
set_alias("iinit",        "singularity exec $MODULE_PATH/$SIMG_FILE iinit")
set_alias("ils",          "singularity exec $MODULE_PATH/$SIMG_FILE ils")
set_alias("ilsresc",      "singularity exec $MODULE_PATH/$SIMG_FILE ilsresc")
set_alias("imcoll",       "singularity exec $MODULE_PATH/$SIMG_FILE imcoll")
set_alias("imeta",        "singularity exec $MODULE_PATH/$SIMG_FILE imeta")
set_alias("imiscsvrinfo", "singularity exec $MODULE_PATH/$SIMG_FILE imiscsvrinfo")
set_alias("imkdir",       "singularity exec $MODULE_PATH/$SIMG_FILE imkdir")
set_alias("imv",          "singularity exec $MODULE_PATH/$SIMG_FILE imv")
set_alias("ipasswd",      "singularity exec $MODULE_PATH/$SIMG_FILE ipasswd")
set_alias("iphybun",      "singularity exec $MODULE_PATH/$SIMG_FILE iphybun")
set_alias("iphymv",       "singularity exec $MODULE_PATH/$SIMG_FILE iphymv")
set_alias("ips",          "singularity exec $MODULE_PATH/$SIMG_FILE ips")
set_alias("iput",         "singularity exec $MODULE_PATH/$SIMG_FILE iput")
set_alias("ipwd",         "singularity exec $MODULE_PATH/$SIMG_FILE ipwd")
set_alias("iqdel",        "singularity exec $MODULE_PATH/$SIMG_FILE iqdel")
set_alias("iqmod",        "singularity exec $MODULE_PATH/$SIMG_FILE iqmod")
set_alias("iqstat",       "singularity exec $MODULE_PATH/$SIMG_FILE iqstat")
set_alias("iquest",       "singularity exec $MODULE_PATH/$SIMG_FILE iquest")
set_alias("iquota",       "singularity exec $MODULE_PATH/$SIMG_FILE iquota")
set_alias("ireg",         "singularity exec $MODULE_PATH/$SIMG_FILE ireg")
set_alias("irepl",        "singularity exec $MODULE_PATH/$SIMG_FILE irepl")
set_alias("irm",          "singularity exec $MODULE_PATH/$SIMG_FILE irm")
set_alias("irmtrash",     "singularity exec $MODULE_PATH/$SIMG_FILE irmtrash")
set_alias("irsync",       "singularity exec $MODULE_PATH/$SIMG_FILE irsync")
set_alias("irule",        "singularity exec $MODULE_PATH/$SIMG_FILE irule")
set_alias("iscan",        "singularity exec $MODULE_PATH/$SIMG_FILE iscan")
set_alias("isysmeta",     "singularity exec $MODULE_PATH/$SIMG_FILE isysmeta")
set_alias("iticket",      "singularity exec $MODULE_PATH/$SIMG_FILE iticket")
set_alias("itrim",        "singularity exec $MODULE_PATH/$SIMG_FILE itrim")
set_alias("iuserinfo",    "singularity exec $MODULE_PATH/$SIMG_FILE iuserinfo")
set_alias("ixmsg",        "singularity exec $MODULE_PATH/$SIMG_FILE ixmsg")
set_alias("izonereport",  "singularity exec $MODULE_PATH/$SIMG_FILE izonereport")
EOF

