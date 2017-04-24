# Launch Multiple Chrome

## Why
For some reason, some web page will save permanent data in user directory and user cannot open this page with different identity. These scripts remove this restriction in a quick way.

## How
Use different user data directory for each instance of chrome by passing the parameter *--user-data-dir* to chrome.

## What
### Windows
* MY_URL - target url
* MY_NUM - number of chromes  to launch
* MY_CHROME_DIR - Chrome executable file base directory
* MY_CHROME_DATA_DIR - Chrome user data base directory

### OS X(MacOS)
* MY_URL - target url
* CHROME_NUM - number of chromes to launch
* CHROME_USER_DIR_ROOT - Chrome user data base directory


### Linux ?
just modify the OSX script a little bit by yourself :P
