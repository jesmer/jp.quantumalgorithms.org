#!/bin/bash

function remove_trailing_whitespaces(){ 

# not working on osx properly..
# sed -e 's/[  ]*$//' -e :a -e '/^\n*$/{$d;N;ba' -e '}' $1
sed -E -i '' 's/[[:space:]]*$//' "$1" 

}



function remove_trailing_whitespace_current_directory() {

for i in *.Rmd; do 
	echo $i
	./remove_trailing_whitespace.sh --rtw "$i" 
done

}



function help(){

        # Do whatever you want with extra options
        echo "remove trailing whitespaces"
        echo " "
	echo "./remove_trailing_whitespaces.sh --rtw FILENAME"
	echo "remove IN PLACE trailing whiespaces"
        echo " "
        echo "./remove_trailing_whitespaces.sh --all"
	echo "remove IN PLACE trailing whitespaces on all Rmd files in the current directory"

}


# MAIN LOOP OF THE PROGRAM
while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
        # This is a flag type option. Will catch either -f or --foo

	--all)
	remove_trailing_whitespace_current_directory 
	exit
	;;

        --rtw)
        remove_trailing_whitespaces $2
        exit
	;;


        *)
	help
        ;;
    esac
    # Shift after checking all the cases to get the next option
    shift
done



help 
