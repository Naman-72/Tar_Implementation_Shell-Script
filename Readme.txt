# Tar_Implementation_Shell-Script
Implementation Of Tar Command in Shell Script

RUNNING command->
chmod +x 200101070_Assign3.sh
./200101070_Assign3.sh

It will Ask The User command
I have implementing checking of the first word tar if yes procced Otherwise printing Invalid Option
But I have not implemented checking of options exists of some invalid option present or not as Sir said to consider only some cases But for generality there 
will be many cases
ALSO THE COMMANDS THE USER SHOULD ENTER ->
SHOULD Exactly CONTAIN one of c,r,t,x options required Otherwise I am displaying error
Also Sir told not to consider for *.txt like PLease give filenames as input only while using c like use a.txt b.txt after filename.tar in archive 
Also please dont give media files like jpeg png mp4 in making Archive
Also while extracting please ensure that same names file what u have archived is not present already in that directory
Also Sir told to take f flag as necessary So i am giving error if f flag is not used
Also Sir told that inside our tar file it is not necessary to maintain file structure so i have not implemented . So for any operation please use tar command
Also Sir told its not needed for archive the directory So I have not implemented it  
Try not to change format please of the tar command Otherwise my tar command will not work properly So please use proper format
Also I have implemented various file seperators string assuming it is not present in file data
For Details about Program WORKING Please see My comments My code is well commented Explaining Mostly every line
Like 
TAR FORMAT ->tar [options] [archive-file] [file to be archived]
PLease Enter in this format only Otherwise it will not work Properly
Example->
After Giving permission
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ |
@naman-VirtualBox:~/Desktop$ ./200101070_Assign3.sh                            |
TAR FORMAT -> tar [options] [archive-file] [file to be archived]               |
PLEASE ENTER THE COMMAND :                                                     |                     
tar cvf naman3.tar t1.txt t2.txt t3.txt                                        |
t1.txt                                                                         |
t2.txt                                                                         |
t3.txt                                                                         |
naman@naman-VirtualBox:~/Desktop$                                              |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ |
I have implemented the following options only Please Give one of the following options only :
cf
cvf
xf
xvf
rf
rvf
tf
tvf

***********************************************************************************************************************************
