#!bin/bash

# Notes:
#   1. This shell script is used to compress the folder by tar and pbzip2 functions.
#   2. Parts of idea are contributed by kmo Li.
#
# History:
#   1. 2018/06/21 First version

# folder name
read -p "Compressed Folder Name: " folder_name

# set up numbers of threads
read -p "Thread Num: " thread_num

# kill the folder or not
read -p "Kill Folder(Y/N): " kill_folder

# check it again
echo "---------------------------------------"
printf "Input: $folder_name \n"
printf "Thread Num: $thread_num: \n"
echo "---------------------------------------"

# check folder exist or not
test ! -e $folder_name && echo "The folder $folder_name does not exist!" && exit 0

# tar
tar_file="$folder_name.tar"
echo -e "$folder_name --> $tar_file"
tar -cf $tar_file $folder_name
#tar -cvf $tar_file $folder_name

# pbzip2
pbzip2 -p$thread_num -v $tar_file

# kill folder
[ "$kill_folder" == "Y" ] && echo -e "kill $folder_name" && rm -fr $folder_name
