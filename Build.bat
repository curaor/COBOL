@echo off
echo user %PUB400_USERNAME%> ftpcmd.dat

echo %PUB400_PASSWORD%>> ftpcmd.dat

echo ASCII>> ftpcmd.dat

echo LCD %WORKSPACE% >> ftpcmd.dat

echo PUT DEMO.CBLLE  /QSYS.LIB/%PUB400_LIB%.LIB/QCBLLESRC.FILE/%PUB400_PGM%.MBR >> ftpcmd.dat

echo quote rcmd CHGPFM FILE(%PUB400_LIB%/QCBLLESRC) MBR(%PUB400_PGM%) SRCTYPE(CBLLE) TEXT('DEVOPS WAY TO DEPLOY') >> ftpcmd.dat

echo quote rcmd CRTBNDCBL PGM(%PUB400_LIB%/%PUB400_PGM%) SRCFILE(%PUB400_LIB%/QCBLLESRC) SRCMBR(%PUB400_PGM%) REPLACE(*YES) OPTION(*EVENTF) DBGVIEW(*SOURCE) >> ftpcmd.dat

echo bye>> ftpcmd.dat

ftp -n -s:ftpcmd.dat PUB400.COM

del "%WORKSPACE%\ftpcmd.dat"

echo "%PUB400_PGM% Program Build in library %PUB400_LIB% Successful!!!"
