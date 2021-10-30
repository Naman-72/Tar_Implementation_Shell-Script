#!/bin/bash
echo "TAR FORMAT -> tar [options] [archive-file] [file to be archived] "
echo "PLEASE ENTER THE COMMAND : "
#value will read the command completely
read value


#Seperating the words using space
IFS=' '
read -a CommandLine <<< "$value"  
# echo  ${#CommandLine[*]}   CHECKING WHETHER CORRECT OR NOT
c=${#CommandLine[*]} 
#echo  ${CommandLine[@]}
# string value= ${CommandLine[@]} # no of words = ${#[*]}
option=${CommandLine[1]}

#CHECKING WHETHER THE FIRST WORD IS TAR OR NOT 
if [[ ${CommandLine[0]} != "tar" ]]
then
echo "INVALID TAR COMMAND "
echo "TAR FORMAT -> tar [options] [archive-file] [file to be archived] "
exit
fi


#BREAKING THE OPTIONS INTO SINGLE LETTERS
declare -a a   # define array a
for ((i=0; i<${#option}; i++)); 
do a[$i]="${option:$i:1}"; 
done
# echo ${a[0]}
# echo ${a[1]}  #JUST FOR CHECK  Whether storing correct or not


# JUST FOR CHECKING IF f option is not there then EXIT THE PROGRAM
for ((j=0;j<${#a[@]};j++))
do 
if [ ${a[$j]} == "f" ]
then
#IT WILL STORE var2 AS 30 if f option otherwise it will use $var2 = 0 anywhere i use
let var2="30"
fi
done
# echo $var2   JUST FOR CHECK
if [ "$var2" = "30" ]
then
var2="30"  #JUST USED THIS LINE AS WE CAN'T DIRECTLY WRITE else after then
 else
 echo
 #TELLING ERROR TO USER
 echo "f option is necessary But Its missing"
 echo "Please Try Again"
exit
fi

let var1=0
#var1 will store how many times it is present 
#FOR EITHER IF c t x r SHOULD BE THERE And atleast one of them Should be there 
for ((j=0;j<${#a[@]};j++))
do 
if [ ${a[$j]} == "c" ]
then
#increasing var1 as soon as it see c
var1=$((var1+1))
fi
if [ ${a[$j]} == "t" ]
then
#increasing var1 as soon as it see t
var1=$((var1+1))
fi
if [ ${a[$j]} == "x" ]
then
#increasing var1 as soon as it see x
var1=$((var1+1))
fi
if [ ${a[$j]} == "r" ]
then
#increasing var1 as soon as it see r
var1=$((var1+1))
fi
done
# echo $var1  JUST FOR CHECK

#FOR CHECKING VAR1 EQUALS TO 1 OR NOT 
if [[ $var1 -gt 0 && $var1 -lt 2 ]]
then
var1=1
else
#IF 0 OR MORE THAN 1 PRINTING WHAT THE USR HAS ERRORED
echo
echo "U HAVE USE MORE THAN ONE MAIN Options t r c x OR Not ANY OF THEM"
echo "USE ONE of OPTIONS -> x c t r and Atleast 1 "
exit
fi

#IT IS USEFUL FOR THE CASE OF V AND T option both present in the options
for ((j=0;j<${#a[@]};j++))
do 
if [ ${a[$j]} == "v" ]
then
variable2=$((variable2+1))
fi
if [ ${a[$j]} == "t" ]
then
variable2=$((variable2+1))
fi
done

# echo $variable2  JUST FOR CHECK

#implementation of all the options 
for ((j=0;j<${#a[@]};j++))
do 
#implementing c option
if [ ${a[$j]} == "c" ]
then 
#Creating the file 
touch ${CommandLine[2]}
#$t will contain the filename
t=${CommandLine[2]}
for ((i=3; i<${#CommandLine[*]}; i++))
do
#filestart is a seperator i used for getting info of the filename
echo "FileStart" >>$t
#passing the filename inside the tar file 
echo ${CommandLine[$i]} >>$t
#fileEnd is used to depict the filename ended here
echo "FileEnd" >>$t
#This command is used for storing metadata of file
echo "FileDataOn" >>$t
ls -l ${CommandLine[i]} >>$t
#This command is used for ending metadata of file
echo "FileDataOff" >>$t
#From here the file data starts so just used as a seperator
echo "namanStart" >>$t
while read line
do
echo $line
done < ${CommandLine[$i]} >> $t
#here file data ends
echo "namanSuccess" >>$t
done
fi 
#Implementing x option
#we have to just utilise the filename which is between filestart and fileend and take the entire data of the file to that file
if [ ${a[$j]} == "x" ]
then
filename=${CommandLine[2]}
while IFS= read -r line; do
    if [[ $line == FileStart ]] ; then
        printline2="yes"
        # Just t make each line start very clear, remove in use.
        read line
    fi
    if [[ $printline2 == "yes" ]] ; then
       file1=$line;
       read line
    fi
    if [[ $line == FileEnd* ]] ; then
        printline2="no"
        read line 
    fi
    #If the line starts with ST then set var to yes.
    if [[ $printline2 == "no" ]] ; then
    if [[ $line == FileDataOn ]] ; then
    read line
    # echo $line  PRINT LS
    read line
    read line
    fi
    fi
    if [[ $printline2 == "no" ]] ; then
    if [[ $line == namanStart* ]] ; then
        printline="yes"
        read line
        # Just t make each line start very clear, remove in use.
    fi
    # If variable is yes, print the line.
    if [[ $printline == "yes" ]] ; then
        if [[ $line != namanSuccess ]]
        then
        echo "$line" >> $file1
        fi
    fi
    #If the line starts with ST then set var to no.
    if [[ $line == namanSuccess* ]] ; then
        printline="no"
        # Just to make each line end very clear, remove in use.
    fi    
    fi
done < "$filename"
fi
#implementing v option and t option
#for implementing the tvf if in option
if [[ $variable2 == 2 ]]
then
#it will give metadata
filename2=${CommandLine[2]}
while IFS= read -r line; do
    if [[ $line == FileStart ]] ; then
        printline2="yes"
        # Just t make each line start very clear, remove in use.
        read line
    fi
    if [[ $printline2 == "yes" ]] ; then
       file1=$line;
       read line
    fi
    if [[ $line == FileEnd* ]] ; then
        printline2="no"
        read line 
    fi
    #If the line starts with ST then set var to yes.
    if [[ $printline2 == "no" ]] ; then
    if [[ $line == FileDataOn ]] ; then
    read line
    echo $line
    read line
    read line
    fi
    fi
    if [[ $printline2 == "no" ]] ; then
    if [[ $line == namanStart* ]] ; then
        printline="yes"
        read line
        # Just t make each line start very clear, remove in use.
    fi
    # If variable is yes, print the line.
    if [[ $printline == "yes" ]] ; then
        if [[ $line != namanSuccess ]]
        then
        NotUsedVariable=0
        # echo "$line" >> $file1
        fi
    fi
    #If the line starts with ST then set var to no.
    if [[ $line == namanSuccess* ]] ; then
        printline="no"
        # Just to make each line end very clear, remove in use.
    fi    
    fi
done < "$filename2"
exit
fi
#Implementing v option 
if [ ${a[$j]} == "v" ]
then
filename3=${CommandLine[2]}
while IFS= read -r line; do
    if [[ $line == FileStart ]] ; then
        printline2="yes"
        # Just t make each line start very clear, remove in use.
        read line
    fi
    if [[ $printline2 == "yes" ]] ; then
       file1=$line;
       echo $file1
       read line
    fi
    if [[ $line == FileEnd* ]] ; then
        printline2="no"
        read line 
    fi
    #If the line starts with ST then set var to yes.
    if [[ $printline2 == "no" ]] ; then
    if [[ $line == FileDataOn ]] ; then
    read line
    read line
    read line
    fi
    fi
    if [[ $printline2 == "no" ]] ; then
    if [[ $line == namanStart* ]] ; then
        printline="yes"
        read line
        # Just t make each line start very clear, remove in use.
    fi
    # If variable is yes, print the line.
    if [[ $printline == "yes" ]] ; then
        if [[ $line != namanSuccess ]]
        then
        v=0
        # echo "$line" >> $file1
        fi
    fi
    #If the line starts with ST then set var to no.
    if [[ $line == namanSuccess* ]] ; then
        printline="no"
        # Just to make each line end very clear, remove in use.
    fi    
    fi
done < "$filename3"
fi
#implementing t option
if [ ${a[$j]} == "t" ]
then
filename3=${CommandLine[2]}
while IFS= read -r line; do
    if [[ $line == FileStart ]] ; then
        printline2="yes"
        # Just t make each line start very clear, remove in use.
        read line
    fi
    if [[ $printline2 == "yes" ]] ; then
       file1=$line;
       echo $file1
       read line
    fi
    if [[ $line == FileEnd* ]] ; then
        printline2="no"
        read line 
    fi
    #If the line starts with ST then set var to yes.
    if [[ $printline2 == "no" ]] ; then
    if [[ $line == FileDataOn ]] ; then
    read line
    read line
    read line
    fi
    fi
    if [[ $printline2 == "no" ]] ; then
    if [[ $line == namanStart* ]] ; then
        printline="yes"
        read line
        # Just t make each line start very clear, remove in use.
    fi
    # If variable is yes, print the line.
    if [[ $printline == "yes" ]] ; then
        if [[ $line != namanSuccess ]]
        then
        v=0
        # echo "$line" >> $file1
        fi
    fi
    #If the line starts with ST then set var to no.
    if [[ $line == namanSuccess* ]] ; then
        printline="no"
        # Just to make each line end very clear, remove in use.
    fi    
    fi
done < "$filename3"
fi
#implementing r option
#it is similiar to the code present in create 
if [ ${a[$j]} == "r" ]
then
#assuming the file already exists
t=${CommandLine[2]}
for ((i=3; i<${#CommandLine[*]}; i++))
do
echo "FileStart" >>$t
echo ${CommandLine[$i]} >>$t
echo "FileEnd" >>$t
echo "FileDataOn" >>$t
ls -l ${CommandLine[i]} >>$t
echo "FileDataOff" >>$t
echo "namanStart" >>$t
while read line
do
echo $line
done < ${CommandLine[$i]} >> $t
echo "namanSuccess" >>$t
done
fi
done
