<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:bk="http://www.book.org"
                exclude-result-prefixes="bk"
                version="1.0">
 
    <xsl:output method="html"/>

    <xsl:template match="/">
        <HTML>
            <BODY>
                <TABLE border="1">
                    <xsl:apply-templates/>
                </TABLE>
            </BODY>
        </HTML>
    </xsl:template>

    <xsl:template match="bk:Book">
         <TR>
             <xsl:apply-templates/>
         </TR>
    </xsl:template>

    <xsl:template match="*">
         <TD>
             <xsl:value-of select="."/>
         </TD>
    </xsl:template>

</xsl:stylesheet>