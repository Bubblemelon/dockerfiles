#!/bin/bash

# Build and test OSTRee on a Container or a VM

# # fetch updates from origin
# git fetch origin

# remote_branch_name=""

# # go to branch with changes
# exitcode="$(git checkout --track origin/del-alias-refs-patch; echo $?)"
# if [[ "$exit_code" == 1 ]]
# then 
#     git checkout del-alias-refs-patch
# fi

# # make sure branch with changes is up-to-date
# git pull origin del-alias-refs-patch

# Build OSTRee 
./autogen.sh 
./configure 
make
make install

# any additional ostree commands go here
