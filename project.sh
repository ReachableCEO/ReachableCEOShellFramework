#!/bin/bash

export FRAMEWORK_INCLUDES_FULL_PATH
FRAMEWORK_INCLUDES_FULL_PATH="$(realpath ./Framework-Includes)"

export FRAMEWORK_CONFIGS_FULL_PATH
FRAMEWORK_CONFIGS_FULL_PATH="$(realpath ./Framework-ConfigFiles)"

export PROJECT_INCLUDES_FULL_PATH
PROJECT_INCLUDES_FULL_PATH="$(realpath ./Project-Includes)"

export PROJECT_CONGIGS_FULL_PATH
PROJECT_INCLUDES_FULL_PATH="$(realpath ./Project-ConfigFiles)"


#Framework variables are read from hee
source $VARS_FULL_PATH/FrameworkVars

#Boilerplate and support functions
FrameworkIncludeFiles="$(ls -1 --color=none includes/*)"

IFS=$'\n\t'
for file in ${FrameworkIncludeFiles[@]}; do
	. "$file"
done
unset IFS


if [[ ProjectIncludes = 1 ]]; then
ProjectIncludeFiles="$(ls -1 --color=none project-includes/*)"
IFS=$'\n\t'
for file in ${ProjectIncludeFiles[@]}; do
	. "$file"
done
unset IFS
fi


#####
#Core framework functions...
#####


while [ ! -z "$1" ];do
   case "$1" in
        -h|--help)
          LocalHelp
          ;;
        -k1|--key1)
          shift
          KEY1="$1"
          echo "key 1 is $KEY1"
          ;;
        -k2|--key2)
          shift
          KEY2="$1"
          echo "key 2 is $KEY2"
          ;;
        *)
	echo "Displaying $0 help..."
	LocalHelp
   esac
shift
done


function main()
{
StrictMode

if [ PreflightCheck = 1 ]; then
PreflightCheck
fi

echo > $LOGFILENAME

#Your custom logic here....
echo "Custom logic here..."
}

main
