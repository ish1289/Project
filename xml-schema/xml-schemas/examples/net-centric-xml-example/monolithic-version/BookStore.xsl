<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xlink="http://www.w3.org/1999/xlink/namespace"
                xmlns:bks="http://www.bookstore.org"
                xmlns:bk="http://www.book.org"
                exclude-result-prefixes="bk bks"
                version="1.0">
 
    <xsl:output method="html"/>

    <xsl:include href="Book.xsl"/>

    <xsl:template match="/">
        <HTML>
            <BODY>
                <xsl:apply-templates/>
            </BODY>
        </HTML>
    </xsl:template>

    <xsl:template match="bks:BookStore">
         <CENTER><H2>My Bookstore</H2></CENTER>
         <TABLE border="1">
             <xsl:apply-templates/>
         </TABLE>
    </xsl:template>

    <xsl:template match="bks:Book">
         <xsl:variable name="book-url" select="document(@xlink:href)"/>
         <xsl:apply-templates select="$book-url//bk:Book"/>
    </xsl:template>

</xsl:stylesheet>