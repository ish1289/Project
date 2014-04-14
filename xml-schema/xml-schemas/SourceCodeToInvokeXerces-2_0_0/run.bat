@ECHO OFF

set oldPath=%path%
set oldCLASSPATH=%CLASSPATH%

set rootdir=..\..\
set which_xerces=xerces-2_0_0

set path=%rootdir%jdk1.3.1\bin

set CLASSPATH=.
set CLASSPATH=%CLASSPATH%;%rootdir%xmlParsers\%which_xerces%\xercesImpl.jar
set CLASSPATH=%CLASSPATH%;%rootdir%xmlParsers\%which_xerces%\xmlParserAPIs.jar
set CLASSPATH=%CLASSPATH%;%rootdir%xmlParsers\%which_xerces%\xercesSamples.jar

java -classpath %CLASSPATH% validate %1

set path=%oldpath%
set CLASSPATH=%oldCLASSPATH%
