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
          <xsl:for-each select="challenges/challenge">
            <h1 class="alignmentCenter">
              <xsl:value-of select="challengeName"/>
            </h1>
            <h2>
              <xsl:if test="area">
                <xsl:value-of select="area"/>   
              </xsl:if>
             <!--Displaying Challenge Description-->  
              <xsl:if test="challengeDescription/challengeDate">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="challengeDescription/challengeDate/from"/>
                <xsl:if test="challengeDescription/challengeDate/to">
                  <xsl:text> to </xsl:text>
                  <xsl:value-of select="challengeDescription/challengeDate/to"/>
                </xsl:if>
              </xsl:if>
              <xsl:if test="challengeDescription/challengeLocation">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="challengeDescription/challengeLocation"/>
              </xsl:if>
              <xsl:if test="challengeDescription/associatedConference">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="challengeDescription/associatedConference"/>
              </xsl:if>
              <xsl:if test="challengeDescription/partOfSeries">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="challengeDescription/partOfSeries"/>
              </xsl:if>  
            </h2>
            <h3>
              <xsl:value-of select="challengeDescription/description"/>
            </h3>
            
            <h3>Rules</h3>
            <xsl:for-each select="rules/rule"> 
                <xsl:if test="ruleCategory">
                  <b>
                  <xsl:value-of select="ruleCategory"/>
                  <xsl:text>: </xsl:text> </b>
                </xsl:if>
              <br/>
              <xsl:value-of select="ruleDescription"/>
              <br/>
              <xsl:if test="inputRequirements">
              <b>Input Requirements-</b>
              <br/>
                <xsl:for-each select="inputRequirements/inputRequirement">
                  <li>
                    <xsl:value-of select="."/>
                  </li>
                </xsl:for-each> 
              </xsl:if> 
              <xsl:if test="outputRequirements">
                <b>Output Requirements-</b>
                <br/>
                <xsl:for-each select="outputRequirements/outputRequirement">
                  <li>
                    <xsl:value-of select="."/>
                  </li>
                </xsl:for-each>
              </xsl:if>
              <xsl:if test="ruleLinkDescription">
                <b>Links-</b>
                <br/>
                <xsl:for-each select="ruleLinkDescription">
                  <li>
                    <xsl:element name="a">
                      <xsl:attribute name="href">
                        <xsl:value-of select="./@xlink:href" />
                      </xsl:attribute>
                      <xsl:value-of select="." />
                    </xsl:element>
                  </li>
                </xsl:for-each>
                <br/>
              </xsl:if>
              <br/>
            </xsl:for-each>
             <xsl:if test="supportingDocuments" >                 
            <h3>Supporting Documents</h3>
            <table border="1">
              <tr bgcolor="green">
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
            <xsl:if test="assessmentDescription">
              <h3>Assessment Description</h3>
              <xsl:if test="assessmentDescription/description">
                <xsl:value-of select="assessmentDescription/description"/>
                <br/>
              </xsl:if>
              <xsl:if test="assessmentDescription/assessmentLinkDescription">
                <b>Links-</b>
                <xsl:for-each select="assessmentDescription/assessmentLinkDescription">
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
              <xsl:if test="assessmentDescription/jury">
                <b>Jury:-</b>
                <xsl:for-each select="assessmentDescription/jury/contact">
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
                  <br/>
              </xsl:for-each>
             </xsl:if>
              <xsl:if test="assessmentDescription/scoreDetails">
               <xsl:for-each select="score">
                 <xsl:if test="points"><xsl:value-of select="points" /><br/></xsl:if>
                 <xsl:value-of select="description" /><br/>
               </xsl:for-each>
             </xsl:if>
            </xsl:if>
            <xsl:if test="participants">
              <h3>
                <xsl:text>Participants-</xsl:text>
              </h3>
              <xsl:for-each select="participants/participant">
                <xsl:value-of select="."/>
                <br/>
              </xsl:for-each>
              <xsl:if test="participants/participantDescriptionLink">
                <xsl:for-each select="participants/participantDescriptionLink">
                  <li><xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:value-of select="./@xlink:href" />
                    </xsl:attribute>
                    <xsl:value-of select="." />
                  </xsl:element>
                  </li>
                </xsl:for-each>
              </xsl:if>
            </xsl:if>
        
          <xsl:if test="benchmarks">
            <h3>Benchmarks</h3>
             <xsl:if test="benchmarks/benchmark">
               <xsl:for-each select="benchmarks/benchmark">
                 <xsl:if test="categories">
                  <b>
                    <xsl:value-of select="categories" />
                  </b>
                   <br/>
                 </xsl:if>
                 <xsl:if test="description">
                   <xsl:text>Description:- </xsl:text>
                   <xsl:value-of select="description" />
                   <br/>
                 </xsl:if>
                 <xsl:if test="format">
                   <xsl:text>Format:- </xsl:text>
                   <xsl:value-of select="format" />
                   <br/>
                 </xsl:if>
                 <xsl:if test="timeline">
                   <xsl:text>Timeline:- </xsl:text>
                   <xsl:value-of select="timeline" />
                   <br/>
                 </xsl:if>
                 <xsl:if test="benchmarkLinkDescription">
                    <xsl:text>Links:- </xsl:text>
                   <xsl:for-each select="benchmarkLinkDescription">
                      <li><xsl:element name="a">
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
          </xsl:if>
          <h3>Expected Solution</h3>
          <xsl:if test="expectedSolution/AllowedForms">
           <xsl:text>Allowed Forms</xsl:text><br/>
           <xsl:for-each select="expectedSolution/AllowedForms">
                <xsl:value-of select="."/><br/>
           </xsl:for-each>
          </xsl:if>
           <xsl:if test="expectedSolution/inputRequirements">
              <b>Input Requirements-</b>
              <br/>
                <xsl:for-each select="expectedSolution/inputRequirements/inputRequirement">
                  <li>
                    <xsl:value-of select="."/>
                  </li>
                </xsl:for-each> 
              </xsl:if>  
              <xsl:if test="expectedSolution/outputRequirements">
                <b>Output Requirements-</b>
                <br/>
                <xsl:for-each select="expectedSolution/outputRequirements/outputRequirement">
                  <li>
                    <xsl:value-of select="."/>
                  </li>
                </xsl:for-each>
              </xsl:if>
              <xsl:if test="expectedSolution/executionEnvironment">
                <b>Execution Enviornment-</b>
                <br/>
                    <xsl:if test="expectedSolution/executionEnvironment/environmentDescription">
                        <xsl:text>Description:- </xsl:text>
                        <xsl:value-of select="expectedSolution/executionEnvironment/environmentDescription" />
                          <br/>
                    </xsl:if>  
                    <xsl:if test="expectedSolution/executionEnvironment/libraries">
                          <xsl:if test="expectedSolution/executionEnvironment/libraries/library">  
                             <xsl:for-each select="expectedSolution/executionEnvironment/libraries/library">
                               <xsl:text>Library Name: - </xsl:text>
                               <xsl:value-of select="libraryName" /><br/>
                               <xsl:if test="libraryLinkDescription">
                                   <xsl:text>Links:- </xsl:text>
                                   <xsl:for-each select="libraryLinkDescription">
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
                    </xsl:if> 
                     <xsl:if test="expectedSolution/executionEnvironment/compilers">    
                       <xsl:for-each select="expectedSolution/executionEnvironment/compilers/compiler">
                         <xsl:text>Compiler Name: - </xsl:text>
                         <xsl:value-of select="compilerName" /><br/>
                         <xsl:if test="compilerDescription">
                             <xsl:text>Compiler Description: - </xsl:text>
                             <xsl:value-of select="compilerDescription" /><br/>
                         </xsl:if>  
                       </xsl:for-each>  
                     </xsl:if> 
                     <xsl:if test="expectedSolution/executionEnvironment/processors">    
                       <xsl:for-each select="expectedSolution/executionEnvironment/processors/processor">
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
                     <xsl:if test="expectedSolution/executionEnvironment/OSUsed">    
                       <xsl:for-each select="expectedSolution/executionEnvironment/OSUsed/OS">
                         <xsl:text>OS Name: - </xsl:text>
                         <xsl:value-of select="osName" /><br/>
                         <xsl:text>OS Version: - </xsl:text>
                         <xsl:value-of select="osVersion" /><br/>  
                       </xsl:for-each>  
                     </xsl:if> 
              </xsl:if>
              <xsl:if test="expectedSolution/deadlines">
                <b>Deadlines-</b>
                  <table border="1">
                    <tr bgcolor="green">
                      <th>Deadline For</th>
                      <th>Date</th>
                     </tr>
                     <xsl:for-each select="expectedSolution/deadlines/deadline">
                     <tr>
                        <td><xsl:value-of select="deadlineName" /></td>
                        <td><xsl:value-of select="submissionDeadline" /></td>
                     </tr>
                     </xsl:for-each>
                  </table>
              </xsl:if>
              <xsl:if test="expectedSolution/allowedSubmissions">
                <b>
                  <xsl:text>Allowed Submissions: - </xsl:text>
                </b>
                <xsl:value-of select="expectedSolution/allowedSubmissions" />
                <br/>
              </xsl:if>
              <xsl:if test="allowedTools">
                <xsl:for-each select="allowedTools/tool">
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
              <xsl:if test="contactDetails">
                <h3>Contacts</h3>
                <xsl:for-each select="contactDetails/contact">
                  <xsl:if test="name">
                    <li>
                      <b><xsl:value-of select="name"/></b>
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
                  <br/>
              </xsl:for-each>
             </xsl:if>
             <xsl:if test="results">
               <h3>Results</h3>
               <xsl:if test="results/resultsLinkDescription">
                 <xsl:for-each select="results/resultsLinkDescription">
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
            <xsl:if test="changes">
              <h3>Changes</h3>
              <xsl:for-each select="changes/change">
                <li>
                  <xsl:text>Change Description:- </xsl:text>
                  <xsl:value-of select="changeDescription"/>
                </li> 
                <xsl:if test="changeDescriptionLink">
                  <xsl:for-each select="changeDescriptionLink">
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
            <xsl:if test="solutions">
            <h3>Solutions</h3>
            <xsl:for-each select="solutions/solution"> 
               <xsl:if test="solutionFormat">
                  <b>
                     <xsl:text>Solution Format:- </xsl:text>
                  </b>
                   <xsl:value-of select="solutionFormat/solutionForm" />
                  <br/>
                   <xsl:if test="solutionFormat/solutionLinkDescription">
                     <xsl:for-each select="solutionFormat/solutionLinkDescription">
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
               <xsl:if test="solutionDescription">
                  <xsl:value-of select="solutionDescription" />
	      </xsl:if>
              <xsl:if test="inputRequirements">
                 <b>Input Requirements-</b>
                 <br/>
                 <xsl:for-each select="inputRequirements/inputRequirement">
                  <li>
                    <xsl:value-of select="."/>
                  </li>
                </xsl:for-each> 
              </xsl:if>  
              <xsl:if test="outputRequirements">
                <b>Output Requirements-</b>
                <br/>
                <xsl:for-each select="outputRequirements/outputRequirement">
                  <li>
                    <xsl:value-of select="."/>
                  </li>
                </xsl:for-each>
              </xsl:if>
              <xsl:if test="executionEnvironment">
                <b>Execution Environment-</b>
                <br/>
                    <xsl:if test="executionEnvironment/environmentDescription">
                        <xsl:text>Description:- </xsl:text>
                        <xsl:value-of select="executionEnvironment/environmentDescription" />
                          <br/>
                    </xsl:if>  
                    <xsl:if test="executionEnvironment/libraries">
                          <xsl:if test="executionEnvironment/libraries/library">  
                             <xsl:for-each select="executionEnvironment/libraries/library">
                               <xsl:text>Library Name: - </xsl:text>
                               <xsl:value-of select="libraryName" /><br/>
                               <xsl:if test="libraryLinkDescription">
                                   <xsl:text>Links:- </xsl:text>
                                   <xsl:for-each select="libraryLinkDescription">
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
              </xsl:if><br/>
	        </xsl:for-each> 
        </xsl:if>
       </xsl:for-each>
      </body>
     </html>
   </xsl:template>
</xsl:stylesheet>

