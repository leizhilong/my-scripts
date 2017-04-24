set MY_URL="https://www.google.com"
set MY_NUM=10
set MY_CHROME_DIR="C:\Program Files (x86)\Google\Chrome\Application"
set MY_CHROME_DATA_DIR=C:\ChromeData\


for /l %%i in (0,1,%MY_NUM%) do start /D %MY_CHROME_DIR% chrome.exe --user-data-dir=%MY_CHROME_DATA_DIR%%%i %MY_URL%
