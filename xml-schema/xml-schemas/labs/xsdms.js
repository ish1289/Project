// xsdms.js
//
// A script to validate an XML document against an XML Schema document
//
// Usage:
//
//      xsdms inputFile schemaFile
//
// If this works it was written by Martin Gudgin ( marting@develop.com )
//

// Crack cmdline args
if (WScript.Arguments.length < 2)
{
   WScript.echo("MSXML XML Schema Validation Utility\n");
   WScript.echo("usage: xsdms inputFile schemaFile <schemaFile>");
   WScript.Quit(1);
}

var schemaCache = new ActiveXObject("MSXML2.XMLSchemaCache.4.0");

var i;  	

for(i=1;i<WScript.Arguments.length;i++)
{
	// schemaSource is used to load schema documents
	// Currentl create a new object for each schema document as I don't know if the cache makes copies
	var schemaSource = new ActiveXObject ( "MSXML2.DOMDocument.4.0" );
	schemaSource.async = false;
	schemaSource.validateOnParse = false;

	// load the schema document
	if (schemaSource.load(WScript.Arguments.Item(i)))
	{
  		try
		{
			// Set up XPath
			schemaSource.setProperty ( "SelectionLanguage", "XPath" );
			schemaSource.setProperty ( "SelectionNamespaces", "xmlns:a='http://www.w3.org/2001/XMLSchema'" );

  			// extract the targetNamespace attribute from the schema using XPath
  			var tnsattr = schemaSource.selectSingleNode ( "/a:schema/@targetNamespace" );
  			var nsuri = tnsattr.nodeValue;

  			// add the schema to the cache
  			schemaCache.add ( nsuri, schemaSource );
		}
		catch ( e )
		{
			WScript.echo ( "Exception adding schema to cache" );
			WScript.echo ( e.description );
		}
	}
	else
	{
  		WScript.echo("Schema error");
  		WScript.echo("### error: " + schemaSource.parseError.reason);
  		WScript.echo("### source: " + schemaSource.parseError.srcText);
  		WScript.echo("### line: " + schemaSource.parseError.line);
	}
}
	
try
{
	// attach the schema cache to a DOM
	var xmlSource = new ActiveXObject("MSXML2.DOMDocument.4.0");
	xmlSource.schemas = schemaCache;

	// load XML document
	xmlSource.async = false;
	xmlSource.validateOnParse = true;

	if (xmlSource.load(WScript.Arguments.Item(0))) 
	{
		WScript.echo("success: Document conforms to the Schema");
	}
	else 
	{
		WScript.echo("Instance error" );
		WScript.echo("### error: " + xmlSource.parseError.reason);
		WScript.echo("### source: " + xmlSource.parseError.srcText);
		WScript.echo("### line: " + xmlSource.parseError.line);
	}
}
catch ( e )
{
	WScript.echo ( "Exception loading instance document" );
	WScript.echo ( e.description );
}


