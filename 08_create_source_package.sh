#!/bin/bash
# Creating source package

```
# Add Python env to your Fission deployment
$ fission env create --name pythonsrc --image fission/python-env:latest --builder fission/python-builder:latest --mincpu 40 --maxcpu 80 --minmemory 64 --maxmemory 128 --poolsize 2

# Zip source code into one file (壓縮後,檔案階層目錄會被取消,所有檔案都在同一層))
$ zip -jr dqabot-src-pkg.zip sourcepkg/

# Create package
$ fission package create --sourcearchive dqabot-src-pkg.zip --env pythonsrc --buildcmd "./build.sh"

# Check the build logs by getting information of the package
# dqabot-src-pkg-zip-8lwt (含有流水號,所以每次會不一樣)
$ fission pkg info --name dqabot-src-pkg-zip-8lwt

# Upload your function code to fission
$ fission fn create --name pushresult2testrail --pkg dqabot-src-pkg-zip-8lwt --entrypoint "pushresult2testrail.main"

# Map GET /pushresult2testrail to your new function
$ fission route create --method GET --url /pushresult2testrail --function pushresult2testrail

# Run the function to see results
$ fission fn test --name pushresult2testrail

```