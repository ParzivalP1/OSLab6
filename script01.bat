chcp 1251 >nul
REM create catalog
mkdir C:\LAB6
REM write OS version
ver > C:\LAB6\ver_osversion.txt
REM write free and busy memory
systeminfo | find "������ ����� ���������� ������" > C:\LAB6\systeminfo_totalmemory.txt 
REM MEM /CLASSIFY ������������ ����� ����� ������������ ������ � ����� ������ ������� Windows
systeminfo | find "��������� ���������� ������" > C:\LAB6\systeminfo_availablememory.txt
REM write logical disk info
wmic logicaldisk get DeviceID, FreeSpace, Size, VolumeName > C:\LAB6\vmic_diskinfo.txt
REM create TEST and copy files from LAB6
mkdir C:\LAB6\TEST
copy C:\LAB6\*.txt C:\LAB6\TEST\
cd C:\LAB6\TEST
copy *.txt system.info
del *.txt
