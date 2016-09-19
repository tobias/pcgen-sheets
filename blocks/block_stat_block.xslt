<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:str="http://xsltsl.sourceforge.net/string.html"
    xmlns:xalan="http://xml.apache.org/xalan"
    >

  <xsl:import href="../xsltsl-1.1/stdlib.xsl"/>
  <xsl:import href="../inc_pagedimensions.xslt"/>


  <!--
      ====================================
      ====================================
      TEMPLATE - ABILITY BLOCK
      ====================================
      ====================================-->
  <xsl:template match="abilities">
    <!-- BEGIN Ability Block -->
    <fo:table table-layout="fixed">
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.22 * (0.29 * $pagePrintableWidth - 9)" />mm</xsl:attribute>
      </fo:table-column>
      <!-- 0.29*$pagePrintableWidth total -->
      <fo:table-column column-width="1mm"/>
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.13 * (0.29 * $pagePrintableWidth - 9)" />mm</xsl:attribute>
      </fo:table-column>
      <fo:table-column column-width="1mm"/>
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.13 * (0.29 * $pagePrintableWidth - 9)" />mm</xsl:attribute>
      </fo:table-column>
      <fo:table-body>
        <fo:table-row>
          
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">ABILITY NAME</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">ABILITY SCORE</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">ABILITY MOD</fo:block>
          </fo:table-cell>
        </fo:table-row>
        <xsl:for-each select="ability">
          <fo:table-row>
            
            <fo:table-cell>
              <xsl:call-template name="attrib">
                <xsl:with-param name="attribute" select="'stat.title'"/>
              </xsl:call-template>
              <fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">
                <xsl:value-of select="name/short"/>
              </fo:block>
              <fo:block line-height="4pt" font-size="4pt">
                <xsl:value-of select="name/long"/>
              </fo:block>
            </fo:table-cell>
            <fo:table-cell/>
            <fo:table-cell>
              <xsl:call-template name="attrib">
                <xsl:with-param name="attribute" select="'stat.score'"/>
              </xsl:call-template>
              <fo:block space-before.optimum="2pt" font-size="10pt">
                <xsl:value-of select="no_temp_score"/>
              </fo:block>
            </fo:table-cell>
            <fo:table-cell/>
            <fo:table-cell>
              <xsl:call-template name="attrib">
                <xsl:with-param name="attribute" select="'stat.modifier'"/>
              </xsl:call-template>
              <fo:block space-before.optimum="2pt" font-size="10pt">
                <xsl:value-of select="no_temp_modifier"/>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
          <fo:table-row height="2pt">
            
            <fo:table-cell/>
          </fo:table-row>
        </xsl:for-each>
      </fo:table-body>
    </fo:table>
    <!-- END Ability Block -->
  </xsl:template>


</xsl:stylesheet>