<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2000/10/XMLSchema"
                xmlns:xsi="http://www.w3.org/2000/10/XMLSchema-instance"
                version="1.0">
 
    <xsl:output method="html"/>
                    
    <xsl:variable name="schemaLocation" select="substring-after(/*/@xsi:schemaLocation,' ')"/>
    <xsl:variable name="schema" select="document($schemaLocation)"/>
    <xsl:variable name="instance" select="/"/>

    <xsl:template match="/">
        <HTML>
            <HEAD>
                <TITLE>Welcome</TITLE>
            </HEAD>
            <BODY>
                <xsl:apply-templates select="$schema//xsd:complexType[@name]"/>
            </BODY>
        </HTML>
    </xsl:template>

    <xsl:template match="xsd:complexType[@name]">
        <table border="1" width="50%">
            <tr><th colspan="3" align="center">Metadata for this Resource: <xsl:value-of select="@name"/></th></tr>
            <tr><th>Property</th><th>Type</th><th>Value</th></tr>
        <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="xsd:element">    
        <xsl:variable name="name" select="@name"/>   
        <xsl:variable name="type" select="@type"/>
        <xsl:if test="not(@maxOccurs)">
            <tr>
                <td align="center"><xsl:value-of select="$name"/></td>
                <td align="center"><xsl:value-of select="$type"/></td>
                <td align="center"><xsl:value-of select="$instance//*[name(.)=$name]"/></td>
            </tr>
        </xsl:if>   
        <xsl:if test="@maxOccurs">   
            <xsl:if test="@maxOccurs=1">
                <tr>
                    <td align="center"><xsl:value-of select="$name"/></td>
                    <td align="center"><xsl:value-of select="$type"/></td>
                    <td align="center"><xsl:value-of select="$instance//*[name(.)=$name]"/></td>
                </tr>
            </xsl:if>    
            <xsl:if test="@maxOccurs &gt; 1">
                <xsl:for-each select="$instance//*[name(.)=$name]">
                    <tr>
                        <td align="center"><xsl:value-of select="$name"/></td>
                        <td align="center"><xsl:value-of select="$type"/></td>
                        <td align="center"><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
            </xsl:if>      
            <xsl:if test="@maxOccurs='unbounded'">
                <xsl:for-each select="$instance//*[name(.)=$name]">
                    <tr>
                        <td align="center"><xsl:value-of select="$name"/></td>
                        <td align="center"><xsl:value-of select="$type"/></td>
                        <td align="center"><xsl:value-of select="."/></td>
                    </tr>
                </xsl:for-each>
            </xsl:if>  
        </xsl:if>  
    </xsl:template>

</xsl:stylesheet>