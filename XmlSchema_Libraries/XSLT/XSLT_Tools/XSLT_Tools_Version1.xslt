<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
    xmlns:xlink="http://www.w3.org/1999/xlink"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <html >
      <style type="text/css">
        .alignmentCenter{
        text-align: center;
        }
        .setWidth{
        width: 50%;
        }
        }
      </style>
      <body>
        <xsl:for-each select="verificationTools/verificationTool">
          <h3 class="alignmentCenter">
            <xsl:value-of select="toolName"/>
          </h3>
          <xsl:if test="toolOverview">
            <h3>
              <xsl:text>Overview:- </xsl:text>
            </h3>
            <xsl:value-of select="toolOverview"/>
            <br/>
          </xsl:if>
          <xsl:if test="contacts">
            <h3>Contributors:-</h3>
            <xsl:for-each select="contacts/contact">
              <xsl:if test="name">
                <li>
                  <xsl:value-of select="name"/>
                </li>
              </xsl:if>
              <xsl:if test="contactsDescription">
                <xsl:text>Description-</xsl:text>
                <xsl:for-each select="contactsDescription">
                  <xsl:value-of select="."/>
                  <br/>
                </xsl:for-each>
              </xsl:if>
              <xsl:if test="phone">
                <xsl:text>Phone-</xsl:text>
                <br/>
                <xsl:for-each select="phone">
                  <xsl:value-of select="."/>
                  <br/>
                </xsl:for-each>
              </xsl:if>
              <xsl:if test="email">
                <xsl:text>Email-</xsl:text>
                <br/>
                <xsl:for-each select="email">
                  <xsl:value-of select="."/>
                  <br/>
                </xsl:for-each>
              </xsl:if>
              <xsl:if test="linkDescription">
                <xsl:for-each select="linkDescription">
                  <xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:value-of select="./@xlink:href" />
                    </xsl:attribute>
                    <xsl:value-of select="." />
                  </xsl:element>
                  <br/>
                </xsl:for-each>
              </xsl:if>
            </xsl:for-each>
          </xsl:if>
          <xsl:if test="availableVersions">
            <h3>
              <xsl:text>Available Versions:-</xsl:text>
            </h3>
            <table border="1">
              <tr bgcolor="#9acd32">
                <th>Version Name</th>
                <th>Description</th>
                <th>Year</th>
                <th>Link</th>
                <th>Status</th>
              </tr>
              <xsl:for-each select="availableVersions/version">
                <tr>
                  <td>
                    <xsl:choose>
                      <xsl:when test="versionName">
                        <xsl:value-of select="versionName"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="description">
                        <xsl:value-of select="description"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="year">
                        <xsl:value-of select="year"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="linkDescription">
                        <table>
                          <xsl:for-each select="linkDescription">
                            <tr>
                              <td>
                                <xsl:element name="a">
                                  <xsl:attribute name="href">
                                    <xsl:value-of select="./@xlink:href" />
                                  </xsl:attribute>
                                  <xsl:value-of select="." />
                                </xsl:element>
                              </td>
                            </tr>
                          </xsl:for-each>
                        </table>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="@status">
                        <xsl:value-of select="@status"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:if>
          <xsl:if test="experimentalContentsOrExtensions">
            <h3>
              <xsl:text>Extensions/Experimental Content:-</xsl:text>
            </h3>
            <xsl:if test="experimentalContentsOrExtensions/contentDescription">
              <b>
                <xsl:text>Description:- </xsl:text>
              </b>
              <xsl:value-of select="experimentalContentsOrExtensions/contentDescription"/>
              <br/>
            </xsl:if>
            <b>
              <xsl:text>Contents-</xsl:text>
            </b>
            <br/>
            <xsl:for-each select="experimentalContentsOrExtensions/content">
              <xsl:if test="name">
                <b>
                  <xsl:value-of select="name"></xsl:value-of>
                </b>
                <br/>
              </xsl:if>
              <xsl:if test="description">
                <xsl:value-of select="description"></xsl:value-of>
                <br/>
              </xsl:if>
              <xsl:if test="linkDescription">
                <xsl:for-each select="linkDescription">
                  <xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:value-of select="./@xlink:href" />
                    </xsl:attribute>
                    <xsl:value-of select="." />
                  </xsl:element>
                  <br/>
                </xsl:for-each>
              </xsl:if>
              <br/>
            </xsl:for-each>
          </xsl:if>
          <xsl:if test="contentFiles">
            <h3>
              <xsl:text>Contents:-</xsl:text>
            </h3>
            <xsl:if test="contentFiles/contentDescription">
              <b>
                <xsl:text>Description:- </xsl:text>
              </b>
              <xsl:value-of select="contentFiles/contentDescription"/>
              <br/>
            </xsl:if>
            <b>
              <xsl:text>Contents-</xsl:text>
            </b>
            <br/>
            <xsl:for-each select="contentFiles/contentFile">
              <xsl:if test="name">
                <b>
                  <xsl:value-of select="name"></xsl:value-of>
                </b>
                <br/>
              </xsl:if>
              <xsl:if test="description">
                <xsl:value-of select="description"></xsl:value-of>
                <br/>
              </xsl:if>
              <xsl:if test="linkDescription">
                <xsl:for-each select="linkDescription">
                  <xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:value-of select="./@xlink:href" />
                    </xsl:attribute>
                    <xsl:value-of select="." />
                  </xsl:element>
                  <br/>
                </xsl:for-each>
              </xsl:if>
              <br/>
            </xsl:for-each>
          </xsl:if>
          <xsl:if test="Functionalities">
            <h3>
              <xsl:text>Functionalities/Features:-</xsl:text>
            </h3>
            <xsl:for-each select="Functionalities/functionality">
              <xsl:if test="name">
                <b>
                  <xsl:value-of select="name"></xsl:value-of>
                </b>
                <br/>
              </xsl:if>
              <xsl:if test="description">
                <xsl:value-of select="description"></xsl:value-of>
                <br/>
              </xsl:if>
              <xsl:if test="linkDescription">
                <xsl:for-each select="linkDescription">
                  <xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:value-of select="./@xlink:href" />
                    </xsl:attribute>
                    <xsl:value-of select="." />
                  </xsl:element>
                  <br/>
                </xsl:for-each>
              </xsl:if>
              <br/>
            </xsl:for-each>
          </xsl:if>
          <xsl:if test="intendedUsers">
            <h3>
              <xsl:text>Intended Users:-</xsl:text>
            </h3>
            <xsl:for-each select="intendedUsers/user">
                  <xsl:value-of select="."></xsl:value-of>
            </xsl:for-each>
          </xsl:if>
          <xsl:if test="howToObtain">
            <h3>
              <xsl:text>Getting the tool:-</xsl:text>
            </h3>
            <table border="1">
              <tr bgcolor="#9acd32">
                <th>Description</th>
                <th>Size</th>
                <th>Format</th>
                <th>Link</th>
                <th>Form</th>
              </tr>
              <xsl:for-each select="howToObtain/Download">
                <tr>
                  <td>
                    <xsl:choose>
                      <xsl:when test="description">
                        <xsl:value-of select="description"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="size">
                        <xsl:value-of select="size"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="format">
                        <xsl:value-of select="format"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="linkDescription">
                        <table>
                          <xsl:for-each select="linkDescription">
                            <tr>
                              <td>
                                <xsl:element name="a">
                                  <xsl:attribute name="href">
                                    <xsl:value-of select="./@xlink:href" />
                                  </xsl:attribute>
                                  <xsl:value-of select="." />
                                </xsl:element>
                              </td>
                            </tr>
                          </xsl:for-each>
                        </table>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="@status">
                        <xsl:value-of select="@status"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:if>
          <xsl:if test="executionEnvironment">
            <h3>
              <xsl:text>Execution Environment:-</xsl:text>
            </h3>
            <xsl:if test="executionEnvironment/languagesUsed">
               <b>Languagues Used: </b>
               <xsl:for-each select="executionEnvironment/languagesUsed/language">
                 <xsl:value-of select="." />
                 <xsl:text>  </xsl:text>  
               </xsl:for-each>  
            </xsl:if>
            <br/>
            <xsl:if test="executionEnvironment/description">
               <xsl:text>Description:- </xsl:text>
               <xsl:value-of select="executionEnvironment/description" />
               <br/>
            </xsl:if>  
            <xsl:if test="executionEnvironment/compilers">    
                <xsl:for-each select="executionEnvironment/compilers/compiler">
                   <xsl:text>Compiler Name: - </xsl:text>
                   <xsl:value-of select="compilerName" /><br/>
                   <xsl:if test="compilerDescription">
                     <xsl:text>Compiler Description: - </xsl:text>
                     <xsl:value-of select="compilerDescription" /><br/>
                   </xsl:if>  
                </xsl:for-each>  
            </xsl:if> 
            <xsl:if test="executionEnvironment/processors">    
                <xsl:for-each select="executionEnvironment/processors/processor">
                    <xsl:text>Processor Name: - </xsl:text>
                    <xsl:value-of select="processorName" /><br/>
                    <xsl:text>Processor Memory: - </xsl:text>
                    <xsl:value-of select="processorMemory" /><br/>
                    <xsl:if test="processorDescription">
                       <xsl:text>Processor Description: - </xsl:text>
                       <xsl:value-of select="processorDescription" /><br/>
                    </xsl:if>  
                 </xsl:for-each>  
             </xsl:if>           
             <xsl:if test="executionEnvironment/OSUsed">    
                <xsl:for-each select="executionEnvironment/OSUsed/OS">
                    <xsl:text>OS Name: - </xsl:text>
                    <xsl:value-of select="osName" /><br/>
                    <xsl:text>OS Version: - </xsl:text>
                    <xsl:value-of select="osVersion" /><br/>  
                 </xsl:for-each>  
             </xsl:if> 
          </xsl:if>
          <xsl:if test="relatedTools">
            <h3>Related Tools</h3>
            <xsl:for-each select="relatedTools/tool">
              <b>
                <xsl:text>Tool Name: - </xsl:text>
              </b>
              <xsl:value-of select="toolName" />
              <br/>
              <b>
                <xsl:text>Description: - </xsl:text>
              </b>
              <xsl:value-of select="toolDescription" />
              <br/>
              <xsl:if test="toolLinkDescription">
                <xsl:text>Links:- </xsl:text>
                <xsl:for-each select="toolLinkDescription">
                  <li>
                    <xsl:element name="a">
                      <xsl:attribute name="href">
                        <xsl:value-of select="./@xlink:href" />
                      </xsl:attribute>
                      <xsl:value-of select="." />
                    </xsl:element>
                  </li>
                </xsl:for-each>
              </xsl:if>
              <br/>
            </xsl:for-each>
          </xsl:if>
          <xsl:if test="relatedLinks">
            <h3>Related Links:- </h3>
            <xsl:if test="relatedLinks/relatedLinkDescription">
              <xsl:for-each select="relatedLinks/relatedLinkDescription">
                <xsl:element name="a">
                  <xsl:attribute name="href">
                    <xsl:value-of select="./@xlink:href" />
                  </xsl:attribute>
                  <xsl:value-of select="." />
                </xsl:element>
                <br/>
              </xsl:for-each>
            </xsl:if>
          </xsl:if>
          <xsl:if test="supportingDocuments" >
            <h3>Supporting Documents</h3>
            <table border="1">
              <tr bgcolor="#9acd32">
                <th>Document Name</th>
                <th>Description</th>
                <th>Link</th>
              </tr>
              <xsl:for-each select="supportingDocuments/document">
                <tr>
                  <td class="setWidth">
                    <xsl:choose>
                      <xsl:when test="documentName">
                        <xsl:value-of select="documentName"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="documentDescription">
                        <xsl:value-of select="documentDescription"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="documentLinkDescription">
                        <table>
                          <xsl:for-each select="documentLinkDescription">
                            <tr>
                              <td>
                                <xsl:element name="a">
                                  <xsl:attribute name="href">
                                    <xsl:value-of select="./@xlink:href" />
                                  </xsl:attribute>
                                  <xsl:value-of select="." />
                                </xsl:element>
                              </td>
                            </tr>
                          </xsl:for-each>
                        </table>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>-</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
          </xsl:if>

        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

