﻿<?xml version="1.0" encoding="utf-8"?>
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
           <xsl:for-each select="libraries/library">
            <h3 class="alignmentCenter">
              <xsl:value-of select="libraryName"/>
            </h3>
             <xsl:if test="libraryOverview">
               <h3>
                 <xsl:text>Overview:-</xsl:text>
               </h3>
                 <xsl:if test="libraryOverview/name">
                   <b>
                     <xsl:value-of select="libraryOverview/name"></xsl:value-of>
                   </b>
                   <br/>
                 </xsl:if>
                 <xsl:if test="libraryOverview/description">
                   <xsl:value-of select="libraryOverview/description"></xsl:value-of>
                   <br/>
                 </xsl:if>
                 <xsl:if test="libraryOverview/linkDescription">
                   <xsl:for-each select="libraryOverview/linkDescription">
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
             </xsl:if>
             <xsl:if test="contributors">
                <h3>Contributors:-</h3>
                <xsl:for-each select="contributors/contact">
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
               <h3><xsl:text>Available Versions:-</xsl:text></h3>
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
                                <xsl:otherwise><xsl:text>-</xsl:text></xsl:otherwise>
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
                <h3><xsl:text>Extensions/Experimental Content:-</xsl:text></h3>
                <xsl:if test="experimentalContentsOrExtensions/contentDescription">
                 <b>
                 <xsl:text>Description:- </xsl:text>
                 </b><xsl:value-of select="experimentalContentsOrExtensions/contentDescription"/>
                  <br/>
               </xsl:if> 
               <b><xsl:text>Contents-</xsl:text></b>
               <br/>
                  <xsl:for-each select="experimentalContentsOrExtensions/content"> 
                    <xsl:if test="name">
                            <b><xsl:value-of select="name"></xsl:value-of></b><br/>
                    </xsl:if>
                    <xsl:if test="description">
                            <xsl:value-of select="description"></xsl:value-of><br/>
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
                   </xsl:if> <br/>
               </xsl:for-each>
             </xsl:if>  
             <xsl:if test="contentFiles">
                <h3><xsl:text>Content Files:-</xsl:text></h3>
                <xsl:if test="contentFiles/contentDescription">
                 <b>
                 <xsl:text>Description:- </xsl:text>
                 </b><xsl:value-of select="contentFiles/contentDescription"/><br/>
               </xsl:if> 
               <b><xsl:text>Contents-</xsl:text></b>
                  <br/>
                  <xsl:for-each select="contentFiles/contentFile"> 
                    <xsl:if test="name">
                            <b><xsl:value-of select="name"></xsl:value-of></b><br/>
                    </xsl:if>
                    <xsl:if test="description">
                            <xsl:value-of select="description"></xsl:value-of><br/>
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
                   </xsl:if> <br/>
               </xsl:for-each>
             </xsl:if>           
             <xsl:if test="downloads">
               <h3><xsl:text>Downloads:-</xsl:text></h3>
                        <table border="1">
                          <tr bgcolor="#9acd32">
                            <th>Description</th>
                            <th>Compatible OS</th>
                            <th>Size</th>
                            <th>Link</th>
                          </tr>
                          <xsl:for-each select="downloads/download">
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
                                <xsl:when test="compatibleOS">
                                  <xsl:value-of select="compatibleOS"/>
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
                                <xsl:otherwise><xsl:text>-</xsl:text></xsl:otherwise>
                               </xsl:choose>
                              </td>
                            </tr>
                          </xsl:for-each>
                        </table>
               </xsl:if>
              <xsl:if test="requiredToolsForCompilation">
                <h3>Tools Required:</h3>
                <xsl:for-each select="requiredToolsForCompilation/tool">
                   <b>
                       <xsl:text>Tool Name: - </xsl:text>
                  </b>
                    <xsl:value-of select="toolName" /><br/>
                    <b><xsl:text>Description: - </xsl:text></b>
                    <xsl:value-of select="toolDescription" /><br/>
                    <xsl:if test="toolLinkDescription">
                        <xsl:text>Links:- </xsl:text>
                        <xsl:for-each select="toolLinkDescription">
                          <li><xsl:element name="a">
                          <xsl:attribute name="href">
                          <xsl:value-of select="./@xlink:href" />
                          </xsl:attribute>
                          <xsl:value-of select="." />
                          </xsl:element>
                          </li>
                        </xsl:for-each>
                    </xsl:if><br/>
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
          <xsl:if test="dependencyDetails">
                <h3><xsl:text>Dependency Details:-</xsl:text></h3>
                  <xsl:for-each select="dependencyDetails/dependency"> 
                    <xsl:if test="name">
                            <b><xsl:value-of select="name"></xsl:value-of></b><br/>
                    </xsl:if>
                    <xsl:if test="description">
                            <xsl:value-of select="description"></xsl:value-of><br/>
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
                   </xsl:if> <br/>
               </xsl:for-each>
            </xsl:if>       
            <xsl:if test="examples">
                <h3><xsl:text>Examples:-</xsl:text></h3>
                  <xsl:for-each select="examples/example"> 
                    <xsl:if test="name">
                            <b><xsl:value-of select="name"></xsl:value-of></b><br/>
                    </xsl:if>
                    <xsl:if test="description">
                            <xsl:value-of select="description"></xsl:value-of><br/>
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
                   </xsl:if> <br/>
               </xsl:for-each>
            </xsl:if>         
            <xsl:if test="references">
                <h3><xsl:text>References:-</xsl:text></h3>
                  <xsl:for-each select="references/reference"> 
                    <xsl:if test="name">
                            <b><xsl:value-of select="name"></xsl:value-of></b><br/>
                    </xsl:if>
                    <xsl:if test="description">
                            <xsl:value-of select="description"></xsl:value-of><br/>
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
                   </xsl:if> <br/>
               </xsl:for-each>
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
                        <xsl:otherwise><xsl:text>-</xsl:text></xsl:otherwise>
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
