#!/bin/bash

# defind functions BEFORE calling them -- so, define at the top


function total_files {

  find $1 -type f | wc -l
}


clear
echo -e "\e[31;43mMaking a tar backup of my BASH directory, press any key to continue\e[0m"
read -p " "
echo
day=$(date +%A)
month=$(date +%B)
year=$(date +%Y)
numberday=$(date +%d)


echo "Today is $day $month $numberday, $year"


echo -e "\e[106mDayName: $day\e[0m"
echo -e "\e[106mDayDate: $numberday\e[0m"
echo -e "\e[106mMonth: $month\e[0m"
echo -e "\e[106mYear: $year\e[0m"
echo 
echo


cal
echo
echo

#hostname information

echo -e "\e[31;43m***** Hostname Information *****\e[0m;"
hostnamectl
echo " "

# Filesystem disk space usage

echo -e "\e[31;43m***** Filesystem disk space usage *****\e[0m;"
df -h
echo " "



# Memory -- free and used

echo -e "\e[31;43m***** Memory -- free and used *****\e[0m;"
free
echo " "

# Memory -- free and used

echo -e "\e[31;43m***** Memory -- free and used *****\e[0m;"
free
echo " "




# System Uptime and Performance Load

echo -e "\e[31;43m***** System Uptime and Performance Load *****\e[0m;"
uptime
echo " "

# Users currently logged in
echo -e "\e[31;43m***** Users currently logged in *****\e[0m;"
who
echo " "

# Processes
echo -e "\e[31;43m***** Processes *****\e[0m;"
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 5
echo " "




# / dest = destination src = source (dont use 'source' since that is a keyword)
dest=~/backups
src=~/bash


total_files $src

echo "Number of directories in /home/compsci --"
total_directories /home/compsci




if [ -d $dest ]; then
echo -e "\e[31;43mBackup folder exists\e[0m"
else
echo -e "\e[31;43mBackup folder does not exist, creating it now ...\e[0m"
mkdir -p $dest
echo 
fi

read -p "Press any key to continue" -n1 -s
mkdir -p $dest/"$day $numberday $month $year"
echo
echo -e "\e[31;43mBackup started...\e[0m"
tar cvfz $dest/"$day $numberday $month $year"/bash_backup.tgz $src
echo
echo -e "\e[31;43mHere is the contents of your backup directory :\e[0m"
cd $dest
ls -ahl 2> logEverything.txt
echo
echo -e "\e[31;43mAnd here is what is inside that directory:\e[0m"
cd "$day $numberday $month $year"
ls -ahl 
echo
echo -e "\e[31;43mAll done, press [enter] to exit\e[0m"
read -p " "
cd -
clear
