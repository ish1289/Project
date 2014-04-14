@ECHO OFF

if '%1 == ' goto no-params
if '%2 == ' goto no-params

set rootdir=..\..\..\

set which_xerces=xerces-2_0_0

set oldPath=%path%
set oldCLASSPATH=%CLASSPATH%

set path=%rootdir%jdk1.3.1\bin

set CLASSPATH=.
set CLASSPATH=%CLASSPATH%;%rootdir%xmlParsers\%which_xerces%\xercesImpl.jar
set CLASSPATH=%CLASSPATH%;%rootdir%xmlParsers\%which_xerces%\xmlParserAPIs.jar
set CLASSPATH=%CLASSPATH%;%rootdir%xmlParsers\%which_xerces%\xercesSamples.jar
set CLASSPATH=%CLASSPATH%;%rootdir%xml-schemas\SourceCodeToUseAnExternalSchemaLocation

echo.
echo ---------------------------------------------------------
echo Running the XERCES Schema Validator with the following specification:
echo    - XML File Being Validated: %1
echo    - targetNamespace/schema URL pairs: %2
echo ---------------------------------------------------------

java -classpath %CLASSPATH% validate %1 %2

echo.
echo Done.
echo.
set path=%oldPath%
set CLASSPATH=%oldCLASSPATH%
goto eof

:no-params
    cls
    echo Oops! You need to run the batch file with 3 arguments.
    echo Here's how to use it ...
    echo.
    echo Usage: "validateExternalSchema <xml filename> '<targetNamespace1> <schema URL1> <targetNamespace2> <schema URL2> ...'" 
    echo.
    goto eof

:eof