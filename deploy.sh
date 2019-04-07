#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project
hugo 

# Go To Public folder
cd public

# Add changes to git
git add -A

# Commit changes
msg="update site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push to published repo
git push origin master

# Come Back up to the Project Root
cd ..

# Add source changes
git add -A

# Commit source changes
git commit -m "$msg"

# Push source 
git push origin master
