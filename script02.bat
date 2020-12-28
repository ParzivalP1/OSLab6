REM create catalog \\имя_хостового_компьютера\temp
echo %computername%
mkdir C:\%computername%\temp
REM give access
net share temp=C:\%computername%\temp 
REM create bat file for copy
cd C:\LAB6
echo copy /Z C:\Windows\RtlExUpd.dll C:\%computername%\temp > copyfile.bat
REM schedule copyfile.bat  every min
schtasks /Create /SC MINUTE /TR C:\LAB6\copyfile.bat /TN copyfile 
REM kill process copy
taskkill /IM copy.exe
REM delete task
schtasks /Delete /TN copyfile
REM compare two files as binary
fc C:\Windows\RtlExUpd.dll C:\%computername%\temp\RtlExUpd.dll /B
REM copy again 
copy /Z C:\Windows\RtlExUpd.dll C:\%computername%\temp\RtlExUpd.dll