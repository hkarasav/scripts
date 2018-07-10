# Script to delete docker log files > 5MB

set +e   # disregard execution break due to errors (in case biglogs.txt doesn't exist)
rm /var/lib/docker/containers/biglogs.txt
set -e   # enable execution break due to errors

cd /var/lib/docker/containers
find . -type f -size +5000000c -name '*.log' > biglogs.txt

while IFS='' read -r line || [[ -n "$line" ]]; do
    rm $line
    touch $line
done < biglogs.txt
