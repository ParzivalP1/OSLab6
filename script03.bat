REM list of services
sc query type=service state=all >C:\LAB6\listofsevices.txt

REM stop service lfsvc
net stop lfsvc
REM timeout
timeout /T 5
REM list of services
sc query type=service state=all >C:\LAB6\listofsevices2.txt
REM compare
fc /c C:\LAB6\listofsevices.txt C:\LAB6\listofsevices2.txt > compareservices.txt
REM start service
net start lfsvc 

