#!/bin/bash
#Database information
dbuser=ilkka
dbpwd=Tummapall0m

#Selects all databases
dbname="--all-databases"

#Formats date variable with current date
date=$( date +%Y-%m-%d )

#The name of the mysql dump file
filename_temp=tyrion-backup-"$date".sql

mysqldump -u $dbuser --password=$dbpwd $dbname > $filename_temp
gzip -9 $filename_temp

#Compressed filename
filename=$filename_temp".gz"

sudo mv $filename /home/ilkka/box/Backups/$filename
