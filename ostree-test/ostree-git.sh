#!/bin/bash

# clone your fork of the OSTRee repo, this will be in the "\" directory
git clone https://github.com/Bubblemelon/ostree.git 
cd ostree

# Add upstream as remote and Update master branch 
git checkout master  
git remote add upstream https://github.com/ostreedev/ostree.git 
git pull --rebase upstream master