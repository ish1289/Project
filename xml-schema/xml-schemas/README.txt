December 7, 2002

Open xml-schema1.ppt.  That is the start of the tutorial.
When you are done with that, open xml-schema2.ppt.

I have provided a number of DOS batch files (i.e., validate.bat,
run-examples.bat, run-lab-answers.bat) to make it easy for
you to schema validate your XML files.  

To use the batch files you will first need to download the
schema validators - xerces (from apache) and xsv (from Henry Thompson).

Here's how to use the batch files.  Suppose that you would 
like to validate BookCatalogue.xml in the examples/example01 folder.  
This is what you do:  

(a) Open a DOS window (click on Start, move the mouse over Programs, 
    select Command Prompt).  

(b) Change directory to the example01 folder.  Here's how to do that:
    Suppose that when you open DOS it opens in c:\WINNT.  To change
    to the correct directory do this:

       cd ..
       cd xml-course\xml-schemas\examples\example01
   
    The cd (change directory) command is used for moving around in the
    windows file system.  The "cd .." means to move "up" one folder.

Running XSV: 

(c) Type in this command:

       validate BookCatalogue.xml

You should see this message:

---------------------------------------------------------
Running xsv with the following specification:
   - XML File Being Validated: BookCatalogue.xml
---------------------------------------------------------
<?xml version='1.0'?>
<xsv docElt='{http://www.publishing.org/namespaces/BookCatalogue}BookCatalogue' instanceAssessed='tr
ue' instanceErrors='0' rootType='[Anonymous]' schemaErrors='0' schemaLocs='http://www.publishing.org
/namespaces/BookCatalogue -> BookCatalogue1.xsd' target='file:/C:/xml-course/xml-schemas/examples/ex
ample01/BookCatalogue.xml' validation='strict' version='XSV 1.173/1.80 of 2000/10/18 15:54:58' xmlns
='http://www.w3.org/2000/05/xsv'>
<importAttempt URI='file:/C:/xml-course/xml-schemas/examples/example01/BookCatalogue1.xsd' namespace
='http://www.publishing.org/namespaces/BookCatalogue' outcome='success'/>
</xsv>

Done.

Unfortunately, the output from xsv is somewhat dense.  However, with
some practice you will find that it contains a lot of useful information.
For now, the things that you want to look for in the output are these:

     instanceErrors='0'
     schemaErrors='0'
     validation='strict'

If you don't see these three things in the output then either: (1) you 
have an error (and the output will contain error messages), or (2) your documents
do not strictly conform to the spec, but there is no explicit error (in
which case you will see validation='lax')

I have worked very hard to create batch files that make it easy to
schema validate your XML files.  I hope that you will use them.  If
you have suggestions on how to further improve them (I'm no whiz at
creating batch files) please let me know.  If someone would like to
create a GUI interface so that people don't have to do everything
from a DOS command line, I would be most grateful (and, of course,
I would publically acknowledge you on my xfront.com Web site).

I have tested my batch files on three platforms - Windows NT, 
Windows 95, and Windows 98. /Roger

   