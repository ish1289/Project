@ECHO OFF

set oldPath=%path%
set oldCLASSPATH=%CLASSPATH%

set rootdir=..\..\
set which_xerces=xerces-1_4_2

set path=c:\jdk1.1.8\bin

set CLASSPATH=c:\jdk1.1.8\lib\classes.zip
set CLASSPATH=%CLASSPATH%;%rootdir%xmlParsers\%which_xerces%\xerces.jar
set CLASSPATH=%CLASSPATH%;.


java -classpath %CLASSPATH% validate %1

set path=%oldpath%
set CLASSPATH=%oldCLASSPATH%

