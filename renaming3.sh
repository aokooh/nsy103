#!/bin/bash


##########################

function list {

	declare -A Myarr

Myarr[jpg]=`(find -type f -name "*.jpg")`
	echo "${Myarr[jpg]}, is present in the directory"

Myarr[jpeg]=`(find -type f -name "*.jpeg")`
        echo "${Myarr[jpeg]} , is present in the directory"

}


#########################

function name {

echo "Renaming the files ..."

siz=$(du -sh $f | awk '{print $1}')
dash="_"

for f in *.jpg *.jpeg 

do

 ((a++))
cdate=$(stat -c %y $f | awk '{print $1}' |sed -e 's/-//g')
mv "$f" "$cdate""$dash""$siz""$dash"$a.jpg

done

}

########################

function Newlist {

	for f in *.jpg 
	do
		echo "The file was rename $f"
	done

}


#########################

function createOrNot {

file=`(find . -type f -name *.jpg -o -type f -name *.jpeg)`

if [ -f "$file" ]

then

        for b in $file

        do

                echo "the file $b are present in the directory"
        done

else
        echo "The files are not present in the directory" 
	echo "Creating files ..."

        sleep 1

        touch filesNSY{1..4}{.jpg,.jpeg}

fi

}

#########################

######Calling functions 

createOrNot
list 
name
sleep 1
Newlist

