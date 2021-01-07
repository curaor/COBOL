@echo off
echo user %PUB400_USERNAME%> ftpcmd.dat

echo %PUB400_PASSWORD%>> ftpcmd.dat

echo ASCII>> ftpcmd.dat

echo LCD %WORKSPACE% >> ftpcmd.dat

echo CD OMARCURA11 >> ftpcmd.dat

echo PUT OMARCURA11/DEMO.CBLLE  QCBLLESRC.DEMO >> ftpcmd.dat

echo quote rcmd CHGPFM FILE(OMARCURA11/QCBLLESRC) MBR(DEMO) SRCTYPE(CBLLE) TEXT('DEVOPS WAY TO DEPLOY') >> ftpcmd.dat

echo quote rcmd CRTBNDCBL PGM(OMARCURA11/DEMO) SRCFILE(OMARCURA11/QCBLLESRC) SRCMBR(DEMO) REPLACE(*YES) OPTION(*EVENTF) DBGVIEW(*SOURCE) >> ftpcmd.dat

echo bye>> ftpcmd.dat

ftp -n -s:ftpcmd.dat PUB400.COM

del "%WORKSPACE%\ftpcmd.dat"

echo "Deployment!!!"
