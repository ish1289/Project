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
           <xsl:for-each select="modules/module">
            <h3 class="alignmentCenter">
              <xsl:value-of select="moduleName"/>
            </h3>
            <h3 class="alignmentCenter">
              <xsl:text>Module code: </xsl:text>
              <xsl:value-of select="moduleCode"/>
            </h3>
           <xsl:if test="school">
             <b><xsl:text>School:- </xsl:text></b> 
             <xsl:value-of select="school"/>
             <br/>
           </xsl:if>
           <xsl:if test="year">
             <b><xsl:text>Year:- </xsl:text></b>
             <xsl:value-of select="year"/>
             <br/>
           </xsl:if>
           <xsl:if test="status">
             <b><xsl:text>Status:- </xsl:text></b>
             <xsl:value-of select="status"/>
             <br/>
           </xsl:if>
           <xsl:if test="requiredFor">
             <b><xsl:text>Required For:- </xsl:text></b>
             <xsl:value-of select="requiredFor"/>
             <br/>
           </xsl:if>
           <xsl:if test="numberOfCredits">
             <b><xsl:text>Number of Credits:- </xsl:text></b>
             <xsl:value-of select="numberOfCredits"/>
             <br/>
           </xsl:if>  
             <xsl:if test="allowedTracks">
               <b><xsl:text>Tracks:-</xsl:text></b>
               <xsl:for-each select="allowedTracks/track"> 
                 <xsl:value-of select="."/><xsl:text> </xsl:text>
               </xsl:for-each>
               <br/>
             </xsl:if>
             <xsl:if test="teachingTermsAllowed">
               <b><xsl:text>Teaching Terms:-</xsl:text></b>
               <xsl:for-each select="teachingTermsAllowed/term"> 
                 <xsl:value-of select="."/><xsl:text> </xsl:text>
               </xsl:for-each>
               <br/>
             </xsl:if>
            <xsl:if test="professors">
                <h3>Professors:-</h3>
                <xsl:for-each select="professors/contact">
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
             <xsl:if test="preRequisites">
               <h3><xsl:text>Pre-requisites:-</xsl:text></h3>
                <xsl:for-each select="preRequisites/preRequisite"> 
                  <li><xsl:value-of select="description"/></li>
                  <xsl:if test="preRequisiteLinkDescription">
                    <xsl:for-each select="preRequisiteLinkDescription">                
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
             <xsl:if test="courseDescription">
                <h3><xsl:text>Course Description:-</xsl:text></h3>
                    <xsl:if test="courseDescription/name">
                            <b><xsl:value-of select="courseDescription/name"></xsl:value-of></b><br/>
                    </xsl:if>
                    <xsl:if test="courseDescription/description">
                            <xsl:value-of select="courseDescription/description"></xsl:value-of><br/>
                    </xsl:if>
                    <xsl:if test="courseDescription/linkDescription">
                      <xsl:for-each select="courseDescription/linkDescription">                
                        <xsl:element name="a">
                        <xsl:attribute name="href">
                        <xsl:value-of select="./@xlink:href" />
                        </xsl:attribute>
                        <xsl:value-of select="." />
                        </xsl:element>
                      <br/>
                    </xsl:for-each>
                   </xsl:if> <br/>
            </xsl:if>   
             <xsl:if test="aims">
               <h3><xsl:text>Aims-</xsl:text></h3>
                <xsl:for-each select="aims/aim"> 
                       <li><xsl:value-of select="description"/></li>
                  <xsl:if test="aimLinkDescription">
                    <xsl:for-each select="aimLinkDescription">                
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
              <xsl:if test="learningOutcomes">
               <h3><xsl:text>Learning Outcomes:-</xsl:text></h3>
               <xsl:for-each select="learningOutcomes/learningOutcome">
                 <li><xsl:value-of select="."/></li> 
               </xsl:for-each>
             </xsl:if>
             <xsl:if test="rules">
              <h3>Rules</h3>
            <xsl:for-each select="rules/rule">
                <xsl:if test="ruleCategory">
                  <b><xsl:value-of select="ruleCategory"/>
                  <xsl:text>: </xsl:text></b><br/>
               </xsl:if>
              <xsl:value-of select="ruleDescription"/>
              <br/>
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
           </xsl:if>
          <xsl:if test="workload">
            <h3>Workload:-</h3>
            <xsl:if test="workload/totalLectureHours">
             <b><xsl:text>Total Lecture Hours:- </xsl:text></b>
             <xsl:value-of select="workload/totalLectureHours"/>
             <br/>
           </xsl:if>  
           <xsl:if test="workload/eachLectureDuration">
             <b><xsl:text>Each Lecture Duration:- </xsl:text></b>
             <xsl:value-of select="workload/eachLectureDuration"/>
             <br/>
           </xsl:if>  
           <xsl:if test="workload/totalPracticalHours">
             <b><xsl:text>Total Practice Hours:- </xsl:text></b>
             <xsl:value-of select="workload/totalPracticalHours"/>
             <br/>
           </xsl:if>  
           <xsl:if test="workload/totalPrivateStudyTime">
             <b><xsl:text>Total Private Study Time:- </xsl:text></b>
             <xsl:value-of select="workload/totalPrivateStudyTime"/>
             <br/>
           </xsl:if>  
           <xsl:if test="workload/assessmentTime">
             <b><xsl:text>Assessment Time:- </xsl:text></b>
             <xsl:value-of select="workload/assessmentTime"/>
             <br/>
           </xsl:if>  
           <xsl:if test="workload/description">
             <b><xsl:text>Description:- </xsl:text></b>
             <xsl:value-of select="workload/description"/>
             <br/>
           </xsl:if>   
          </xsl:if>   
          <xsl:if test="feedback">
            <h3>Feedback:-</h3>
            <xsl:value-of select="feedback/feedbackDescription"/>
            <xsl:if test="feedback/feedbackLinkDescription">
                    <xsl:for-each select="feedback/feedbackLinkDescription">                
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
          <xsl:if test="location">
          <b>Location:- </b>
          <xsl:value-of select="location"/>
            <br/>
          </xsl:if>    
          <xsl:if test="results">
               <h3>Results:- </h3>
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
         <xsl:if test="requiredLinks">
               <h3>Required Links:- </h3>
               <xsl:if test="requiredLinks/relatedLinkDescription">
                 <xsl:for-each select="requiredLinks/relatedLinkDescription">
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
          <xsl:if test="content">
            <h3>Contents:-</h3>
            <xsl:if test="content/topicsCovered">
              <b><xsl:text>Topics Covered-</xsl:text></b><br/>
                <xsl:for-each select="content/topicsCovered/topic"> 
                       <li><xsl:value-of select="description"/></li>
                  <xsl:if test="LinkDescription">
                    <xsl:for-each select="LinkDescription">                
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
            <xsl:if test="content/teachingMaterial">
              <b><xsl:text>Teaching Material-</xsl:text></b><br/>
                <xsl:for-each select="content/teachingMaterial/material"> 
                  <li><xsl:value-of select="materialName"/></li>
                  <xsl:if test="materialType">
                     <b><xsl:text>Material Type: </xsl:text></b>
                     <xsl:value-of select="materialType"/>
                  <br/>
                  </xsl:if>
                  <xsl:if test="materialDescription">
                     <b><xsl:text>Description: </xsl:text></b>
                     <xsl:value-of select="materialDescription"/>
                  <br/>
                  </xsl:if>
                  <xsl:if test="materialLinkDescription">
                    <xsl:for-each select="materialLinkDescription">                
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
            <xsl:if test="content/startDate">
             <b>Start Date:- </b>
             <xsl:value-of select="content/startDate"/><br/>
            </xsl:if>
           <xsl:if test="content/endDate">
             <b>Start Date:- </b>
             <xsl:value-of select="content/endDate"/><br/>
            </xsl:if>
            <xsl:if test="content/books">
                <b>Books-</b>
                  <table border="1">
                    <tr bgcolor="#9acd32">
                      <th>Book Name</th>
                        <xsl:if test="content/books/book/bookType">
                          <th>Book Type</th>    
                        </xsl:if>
                        <xsl:if test="content/books/book/bookDescription">
                          <th>Description</th>    
                        </xsl:if>
                        <xsl:if test="content/books/book/bookAuthor">
                          <th>Author</th>    
                        </xsl:if>  
                        <xsl:if test="content/books/book/bookPublisher">
                          <th>Publisher</th>    
                        </xsl:if>  
                         <xsl:if test="content/books/book/bookYear">
                          <th>Year</th>    
                        </xsl:if>  
                         <xsl:if test="content/books/book/bookLinkDescription">
                          <th>Link</th>    
                        </xsl:if>    
                     </tr>
                     <xsl:for-each select="content/books/book">
                     <tr>
                        <td><xsl:value-of select="bookName"/></td>
                        <xsl:if test="bookType">
                           <td><xsl:value-of select="bookType" /></td>
                        </xsl:if>
                         <xsl:if test="bookDescription">
                           <td><xsl:value-of select="bookDescription" /></td>
                        </xsl:if>
                         <xsl:if test="bookAuthor">
                           <td><xsl:value-of select="bookAuthor" /></td>
                        </xsl:if>
                         <xsl:if test="bookPublisher">
                           <td><xsl:value-of select="bookPublisher" /></td>
                        </xsl:if>
                         <xsl:if test="bookYear">
                           <td><xsl:value-of select="bookYear" /></td>
                        </xsl:if>
                        <xsl:if test="bookLinkDescription">
                           <td>
                         	  <table>
                                   <xsl:for-each select="bookLinkDescription">
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
                   	     </td>
                        </xsl:if>
                     </tr>
                     </xsl:for-each>
                  </table>
              </xsl:if>
              <xsl:if test="content/allowedTools">
                <xsl:for-each select="content/allowedTools/tool">
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
             <xsl:if test="content/assessment">
               <b>Assessment:- </b><br/>
               <xsl:if test="content/assessment/description">
                  <b>Description:- </b>
                 <xsl:value-of select="content/assessment/description"/><br/>
               </xsl:if>
               <xsl:if test="content/assessment/startDate">
                  <b>Start Date:- </b>
               <xsl:value-of select="content/assessment/startDate"/><br/>
              </xsl:if>
               <xsl:if test="content/assessment/endDate">
                  <b>End Date:- </b>
               <xsl:value-of select="content/assessment/endDate"/><br/>
              </xsl:if>
              <xsl:if test="content/assessment/assignments">
                  <b>Assignments:- </b>
                <br/>
                  <xsl:for-each select="content/assessment/assignments/assignment">
                    <b><xsl:text>Description:- </xsl:text></b>
                    <xsl:value-of select="description" /><br/>
                    <b>
                       <xsl:text>Weight:- </xsl:text>
                    </b>
                    <xsl:value-of select="weight" /><br/>
                    <xsl:if test="LinkDescription">
                        <xsl:text>Links:- </xsl:text>
                        <xsl:for-each select="LinkDescription">
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
             <xsl:if test="content/assessment/exams">
                  <b>Exams:- </b>
                <br/>
                  <xsl:for-each select="content/assessment/exams/exam">
                    <b><xsl:text>Description:- </xsl:text></b>
                    <xsl:value-of select="description" /><br/>
                    <b>
                       <xsl:text>Weight:- </xsl:text>
                    </b>
                    <xsl:value-of select="weight" /><br/>
                    <xsl:if test="LinkDescription">
                        <xsl:text>Links:- </xsl:text>
                        <xsl:for-each select="LinkDescription">
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
         </xsl:if>   
      
           </xsl:for-each>  
         </body>
      </html>
    </xsl:template>
</xsl:stylesheet>

