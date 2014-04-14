@ECHO OFF

set which_saxon=instant-saxon-5.5.1

if '%1 == ' goto no-params

if %1 == help goto myhelp

if not exist %1 goto no-xml-file

if not exist %2 goto no-xsl-file

if '%3 == ' goto no-output-file

set rootdir=..\..\..\

if not exist %rootdir%xslProcessors\%which_saxon%\saxon.exe goto no-saxon-exe

set oldPath=%path%
set path=%path%;%rootdir%xslProcessors\%which_saxon%
echo.
echo ---------------------------------------------------------
echo Running the XSL Processor, Saxon, with the following specifications:
echo    - XML File: %1
echo    - XSL File: %2
echo    - Output File: %3
echo ---------------------------------------------------------
saxon -o %3 %1 %2
echo.
echo Done.
echo.
set path=%oldPath%
goto eof

:no-params
    cls
    echo Oops! You need to run the batch file with 3 arguments.
    echo Here's how to use it ...
    echo.
    echo Usage: "run-saxon <xml filename> <xsl filename> <output filename>"
    echo.
    goto eof

:myhelp
    cls
    echo Usage: "run-saxon <xml filename> <xsl filename> <output filename>"
    echo.
    goto eof

:no-xml-file
   cls
   echo Oops! %1 does not exist
   echo Most likely reason: mistyped filename
   echo Exiting ...
   echo.
   goto eof

:no-xsl-file
   cls
   echo Oops! %2 does not exist
   echo Most likely reason: mistyped filename
   echo Exiting ...
   echo.
   goto eof

:no-output-file
   cls
   echo Oops! You must specify an output file
   echo Exiting ...
   echo.
   goto eof

:no-saxon-exe
   cls
   echo Oops! Missing this saxon file: %rootdir%xslProcessors\%which_saxon%\saxon.exe
   echo Most likely reason: saxon not installed in the correct directory
   echo Exiting ...
   goto eof

:eof

