@echo off
echo user %PUB400_USERNAME%> ftpcmd.dat

echo %PUB400_PASSWORD%>> ftpcmd.dat

echo ASCII>> ftpcmd.dat

echo LCD %WORKSPACE% >> ftpcmd.dat

echo CD /QSYS.LIB/%PUB400_LIB%.LIB >> ftpcmd.dat

echo PUT DEMO.CBLLE  /QSYS.LIB/%PUB400_LIB%.LIB/QCBLLESRC.FILE/%PUB400_PGM%.MBR >> ftpcmd.dat

echo quote rcmd CHGPFM FILE(%PUB400_LIB%/QCBLLESRC) MBR(%PUB400_PGM%) SRCTYPE(CBLLE) TEXT('%PUB400_TEXT%') >> ftpcmd.dat

echo quote rcmd CRTBNDCBL PGM(%PUB400_LIB%/%PUB400_PGM%) SRCFILE(%PUB400_LIB%/QCBLLESRC) SRCMBR(%PUB400_PGM%) REPLACE(*YES) OPTION(*EVENTF) DBGVIEW(*SOURCE) >> ftpcmd.dat

echo quote rcmd CRTSAVF  FILE(%PUB400_LIB%/%PUB400_PGM%SAVF) >> ftpcmd.dat

echo quote rcmd CLRSAVF FILE(%PUB400_LIB%/%PUB400_PGM%SAVF) >> ftpcmd.dat

echo quote rcmd SAVOBJ OBJ(DEMO) LIB(%PUB400_LIB%) DEV(*SAVF) SAVF(%PUB400_LIB%/%PUB400_PGM%SAVF) >> ftpcmd.dat

echo BIN >> ftpcmd.dat

echo GET %PUB400_PGM%SAVF.SAVF >> ftpcmd.dat

echo bye >> ftpcmd.dat

@echo off

ftp -n -s:ftpcmd.dat %PUB400_MACHINE%

echo "%PUB400_PGM% Program Build in %PUB400_MACHINE% library %PUB400_LIB% Completed"

del "%WORKSPACE%\ftpcmd.dat"
