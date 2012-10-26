#!/bin/bash

################################################################
#
# Check for FIP MEMBER files.  For each file found, collect the
# additional required data for processing and pass the pair of
# files to Locator for processing on MSSQL.
#
################################################################
function debugLog()
{
  if [ $DODEBUG = 1 ]; then
    echo $1
  fi
}

function extractCids()
{
  echo "--> create a temp file holding extracted program and member cids"

  tempFile="$2/cids.txt"

   if [ -e $tempFile ]; then
     debugLog '--> file exists, remove it'

     rm $tempFile
   else
     debugLog '--> file does not exist'
   fi
   
  awk 'BEGIN { FS = "\",\"" } ; {print $4,",", $5 }' $1 > "$tempFile"
}

function generateUidFile()
{
  echo "     generate UidFile for : $1"
  psql -h $HOST -d $DB_NAME -U $DB_USER -f getUniqueMemberId.sql
}

################################################################
# main()

#date_time=`date +%Y%m%d-%H%M%S`
#set the DB specific variables to be passed in as command arguments
HOST=localhost
DB_NAME=280_data
DB_USER=meridian
DODEBUG=1

cli_dir=`dirname "$0"`/..
cli_dir=`(cd "${cli_dir}"; pwd)`
bin_dir="$cli_dir/bin"
from_access_dir=`(cd "$cli_dir"/../from_access; pwd)`

echo $bin_dir
echo "PROCESSING FROM : $cli_dir"
#echo $from_access_dir

shopt -s nullglob
FILES="$from_access_dir/AD-WG-1780-*-MEMBER.csv"
 
for f in $FILES
do
  # take action on each file.
  echo "PROCESSING : $f"
  # extract CIDs from FIP MEMBER file
  extractCids $f $from_access_dir
  # generate unique id file
  generateUidFile $f
  # push to files to locator 
done


exit
:<<supercalifragilisticexpialidocious
# Build out working directories
mtg_dir="${cli_dir}/../.."
logs_dir="${mtg_dir}/logs"
mkdir -p "${logs_dir}" || exit 1
log_file="${logs_dir}"/`basename "$0"`-"${date_time}".log

status_msg="SUCCESS"

"${cli_dir}"/bin/mtg-cli >"${log_file}" 2>&1
if [ $? -ne 0 ]; then
   status_msg="FAILURE"
else
  err_count=`grep -ic 'ERROR\|Exception' ${log_file}`
  if [ $err_count -gt 0 ]; then
    status_msg="ERRORS OCCURRED DURING PROCESSING"
  fi
fi

echo "${status_msg}" >>"${log_file}"
supercalifragilisticexpialidocious


