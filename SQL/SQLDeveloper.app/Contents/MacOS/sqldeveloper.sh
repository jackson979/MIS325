#!/bin/bash 
/usr/libexec/java_home -v 1.8
if [[ $? != 0 ]]; then
    osascript -e 'tell app "System Events" to display dialog "SQL Developer requires Java 8. \nJava 8 can be downloaded from:\n http://www.oracle.com/technetwork/java/javase/downloads/"'
    exit 1;
fi
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
here="${0%/*}"
cd "${here}"
cd ../Resources/sqldeveloper/sqldeveloper/bin
bash ./sqldeveloper >>/dev/null
