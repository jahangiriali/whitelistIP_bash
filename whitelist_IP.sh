
#!/bin/bash
#This script checks given path for .htaccess file to add entry to allow an IP Address.
# Ali Jahangiri - March 31, 2019
path="/var/www/"
DATE=`date +%Y-%m-%d`
#Function to check if there is any .htaccess file in the path.
checkpathforfile (){
 [[ ! -z `find $path -name '.htaccess'` ]] && echo "Scanning Path is $path" || echo "No .htaccess file found!"; exit;
 }
#Check if there is any argument.
if [ -z "$1" ]
  then
    echo "Please give the IP you want to whitelist as an argument! ./whitelist_IP.sh 10.10.10.10"
    exit
else
    checkpathforfile
    for file in "`find $path -name ".htaccess"`"; do
      if grep -q "$1" "$file";
      then
        echo "$1 is exist in $file"
      else
        echo "$1 has been added to $file"
        echo "ALLOW $1#$DATE" >> $file
    fi
  done
fi
