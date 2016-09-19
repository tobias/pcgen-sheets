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
      TEMPLATE - HP
      ====================================
      ====================================-->
  <xsl:template match="character" mode="hp_table">
    <fo:table table-layout="fixed">
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.3 * (0.14 * $pagePrintableWidth)" />mm</xsl:attribute>
      </fo:table-column>
      <fo:table-column/>
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.3 * (0.14 * $pagePrintableWidth)" />mm</xsl:attribute>
      </fo:table-column>
      <fo:table-column/>
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.3 * (0.14 * $pagePrintableWidth)" />mm</xsl:attribute>
      </fo:table-column>
      <fo:table-column/>
      <fo:table-body>
        <fo:table-row>

          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'hp.title'"/>
            </xsl:call-template>
            <fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">HP</fo:block>
            <fo:block text-align="center" font-size="4pt">Hit Points</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'hp.total'"/>
            </xsl:call-template>
            <fo:block line-height="10pt" font-size="10pt" space-before="1mm"><xsl:value-of select="hit_points/points"/></fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'hp.total'"/>
            </xsl:call-template>
            <fo:block line-height="10pt">&#160;</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
        </fo:table-row>
        <fo:table-row>
          <fo:table-cell/>
          <fo:table-cell/>
          <fo:table-cell/>
          <fo:table-cell/>
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="4pt">CURRENT</fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
          <fo:table-cell display-align="after" number-columns-spanned="5">
            <fo:block text-align="center" font-size="4pt">NON-LETHAL</fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
          <fo:table-cell display-align="center" number-columns-spanned="5">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'hp.total'"/>
            </xsl:call-template>
            <fo:block line-height="10pt">&#160;</fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
          <fo:table-cell display-align="after" number-columns-spanned="5">
            <fo:block text-align="center" font-size="4pt">DR</fo:block>
          </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
          <fo:table-cell display-align="center" number-columns-spanned="5">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'damage.reduction'"/>
            </xsl:call-template>
            <fo:block line-height="10pt" font-size="8pt" space-before="1mm">
              <xsl:if test="hit_points/damage_reduction != ''">
                <xsl:value-of select="hit_points/damage_reduction"/>
              </xsl:if>
              &#160;
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
        <!-- <fo:table-row> -->
        <!--   <fo:table-cell display-align="after"> -->
        <!--     <fo:block text-align="center" font-size="4pt">SPEED</fo:block> -->
        <!--   </fo:table-cell> -->
        <!-- </fo:table-row> -->
        <!-- <fo:table-row> -->
        <!--   <fo:table-cell display-align="center"> -->
        <!--     <xsl:call-template name="attrib"> -->
        <!--       <xsl:with-param name="attribute" select="'speed'"/> -->
        <!--     </xsl:call-template> -->
        <!--     <fo:block font-size="8pt"> -->
        <!--       <xsl:value-of select="basics/move/all"/> -->
        <!--       <xsl:value-of select="basics/move/move/maneuverability"/> -->
        <!--     </fo:block> -->
        <!--   </fo:table-cell> -->
        <!-- </fo:table-row> -->
      </fo:table-body>
    </fo:table>
    <!-- END HP Table -->
  </xsl:template>
  <!--
      ====================================
      ====================================
      TEMPLATE - AC TABLE
      ====================================
      ====================================-->
  <xsl:template match="armor_class">
    <fo:table table-layout="fixed" space-before="2pt">
      <fo:table-column column-width="12mm"/>  <!--    1       -->
      <!-- TITLE -->
      <fo:table-column column-width="1mm"/>   <!--    2       -->
      <!-- space -->
      <fo:table-column column-width="8mm"/>   <!--    3       -->
      <!-- TOTAL AC -->
      <fo:table-column column-width="1mm"/>   <!--    4       -->
      <!-- : -->
      <fo:table-column column-width="8mm"/>   <!--    5       -->
      <!-- FLAT -->
      <fo:table-column column-width="1mm"/>   <!--    6       -->
      <!-- : -->
      <fo:table-column column-width="8mm"/>   <!--    7       -->
      <!-- TOUCH -->
      <fo:table-column column-width="2mm"/>   <!--    8       -->
      <!-- = -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>      <!--    9       -->
      <!-- BASE -->
      <fo:table-column column-width="2mm"/>   <!--    10      -->
      <!-- + -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute> <!--    11      -->
      </fo:table-column>
      <!-- armour -->
      <fo:table-column column-width="2mm"/>   <!--    12      -->
      <!-- + -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>      <!--    13      -->
      <!-- armour -->
      <fo:table-column column-width="2mm"/>   <!--    14      -->
      <!-- + -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    15      -->
      <!-- stat -->
      <fo:table-column column-width="2mm"/>   <!--    16      -->
      <!-- + -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>      <!--    17      -->
      <!--size -->
      <fo:table-column column-width="2mm"/>   <!--    18      -->
      <!-- + -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>      <!--    19      -->
      <!-- natural armour-->
      <fo:table-column column-width="2mm"/>   <!--    20      -->
      <!-- + -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.09 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>      <!--    21      -->
      <!-- deflection -->
      <fo:table-column column-width="2mm"/>   <!--    22      -->
      <!-- + -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.09 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>      <!--    23      -->
      <!-- Dodge -->
      <fo:table-column column-width="2mm"/>   <!--    24      -->
      <!-- + -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    25      -->
      <!-- misc-->
      <fo:table-column column-width="2mm"/>   <!--    26      -->
      <!-- space -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>      <!--    27      -->
      <!-- miss chance -->
      <fo:table-column column-width="2mm"/>   <!--    28      -->
      <!-- space -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>      <!--    29      -->
      <!-- arcane spell failure -->
      <fo:table-column column-width="2mm"/>   <!--    30      -->
      <!-- space -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>      <!--    31      -->
      <!-- armour check-->
      <fo:table-column column-width="2mm"/>   <!--    32      -->
      <!-- space -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>      <!--    33      -->
      <!-- SR <33 columns> -->
      <fo:table-body>
        <fo:table-row>

          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac.title'"/>
            </xsl:call-template>
            <fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">AC</fo:block>
            <fo:block line-height="4pt" font-size="4pt">armor class</fo:block>
          </fo:table-cell>        <!--    1       -->
          <fo:table-cell/>        <!--    2       -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac.total'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="total"/>
            </fo:block>
          </fo:table-cell>        <!--    3       -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">:</fo:block>
          </fo:table-cell>        <!--    4       -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac.flatfooted'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="flat"/>
            </fo:block>
          </fo:table-cell>        <!--    5       -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">:</fo:block>
          </fo:table-cell>        <!--    6       -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac.touch'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="touch"/>
            </fo:block>
          </fo:table-cell>        <!--    7       -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">=</fo:block>
          </fo:table-cell>        <!--    8       -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="base"/>
            </fo:block>
          </fo:table-cell>        <!--    9       -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    10      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="armor_bonus"/>
            </fo:block>
          </fo:table-cell>        <!--    11      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    12      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="shield_bonus"/>
            </fo:block>
          </fo:table-cell>        <!--    13      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    14      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="stat_mod"/>
            </fo:block>
          </fo:table-cell>        <!--    15      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    16      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="size_mod"/>
            </fo:block>
          </fo:table-cell>        <!--    17      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    18      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="natural"/>
            </fo:block>
          </fo:table-cell>        <!--    19      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    20      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="deflection"/>
            </fo:block>
          </fo:table-cell>        <!--    21      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    22      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="dodge"/>
            </fo:block>
          </fo:table-cell>        <!--    23      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    24      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block text-align="center" font-size="10pt">
              <xsl:value-of select="morale"/>
            </fo:block>
          </fo:table-cell>        <!--    25      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    26      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block text-align="center" font-size="10pt">
              <xsl:value-of select="insight"/>
            </fo:block>
          </fo:table-cell>        <!--    27      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    28      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block text-align="center" font-size="10pt">
              <xsl:value-of select="sacred"/>
            </fo:block>
          </fo:table-cell>        <!--    29      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    30      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block text-align="center" font-size="10pt">
              <xsl:value-of select="profane"/>
            </fo:block>
          </fo:table-cell>        <!--    31      -->
          <fo:table-cell display-align="center">
            <fo:block text-align="center" font-size="6pt">+</fo:block>
          </fo:table-cell>        <!--    32      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac'"/>
            </xsl:call-template>
            <fo:block text-align="center" font-size="10pt">
              <xsl:value-of select="misc"/>
            </fo:block>
          </fo:table-cell>        <!--    33      -->
          <!-->   <fo:table-cell/>        -->
        </fo:table-row>
        <fo:table-row height="0.5pt">
          <fo:table-cell/>
        </fo:table-row>
        <fo:table-row>

          <fo:table-cell/>        <!--    1       -->
          <fo:table-cell/>        <!--    2       -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="6pt">TOTAL</fo:block>
          </fo:table-cell>        <!--    3       -->
          <fo:table-cell/>        <!--    4       -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="6pt">FLAT</fo:block>
          </fo:table-cell>        <!--    5       -->
          <fo:table-cell/>        <!--    6       -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="6pt">TOUCH</fo:block>
          </fo:table-cell>        <!--    7       -->
          <fo:table-cell/>        <!--    8       -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">BASE</fo:block>
          </fo:table-cell>        <!--    9       -->
          <fo:table-cell/>        <!--    10      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">ARMOR BONUS</fo:block>
          </fo:table-cell>        <!--    11      -->
          <fo:table-cell/>        <!--    12      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">SHIELD BONUS</fo:block>
          </fo:table-cell>        <!--    13      -->
          <fo:table-cell/>        <!--    14      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">STAT</fo:block>
          </fo:table-cell>        <!--    15      -->
          <fo:table-cell/>        <!--    16      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">SIZE</fo:block>
          </fo:table-cell>        <!--    17      -->
          <fo:table-cell/>        <!--    18      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="3pt">NATURAL ARMOR</fo:block>
          </fo:table-cell>        <!--    19      -->
          <fo:table-cell/>        <!--    20      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="3pt">DEFLEC- TION</fo:block>
          </fo:table-cell>        <!--    21      -->
          <fo:table-cell/>        <!--    22      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">DODGE</fo:block>
          </fo:table-cell>        <!--    23      -->
          <fo:table-cell/>        <!--    24      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">Morale</fo:block>
          </fo:table-cell>        <!--    25      -->
          <fo:table-cell/>        <!--    26      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">Insight</fo:block>
          </fo:table-cell>        <!--    27      -->
          <fo:table-cell/>        <!--    28      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">Sacred</fo:block>
          </fo:table-cell>        <!--    29      -->
          <fo:table-cell/>        <!--    30      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">Profane</fo:block>
          </fo:table-cell>        <!--    31      -->
          <fo:table-cell/>        <!--    32      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">MISC</fo:block>
          </fo:table-cell>        <!--    33      -->

          <!-->                   <fo:table-cell/> -->    <!--    34      -->

        </fo:table-row>
      </fo:table-body>
    </fo:table>
    <!-- END AC Table -->
  </xsl:template>
  <!--
      ====================================
      ====================================
      TEMPLATE - Initiative TABLE + Misc
      ====================================
      ====================================-->
  <xsl:template match="initiative">
    <!-- BEGIN ini-base table -->
    <fo:table table-layout="fixed">         <!--space-before="2pt"-->
      <!-- 0.26 * $pagePrintableWidth - mm -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.49 * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
      </fo:table-column>              <!--    1       -->
      <fo:table-column column-width="2mm"/>           <!--    2       -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.17 * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
      </fo:table-column>              <!--    3       -->
      <fo:table-column column-width="2mm"/>           <!--    4       -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.17 * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
      </fo:table-column>              <!--    5       -->
      <fo:table-column column-width="2mm"/>           <!--    6       -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.17 * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
      </fo:table-column>              <!--    7       -->
      <fo:table-column column-width="4mm"/>           <!--    8       -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    9       -->
      <!-- miss chance -->
      <fo:table-column column-width="2mm"/>           <!--    10      -->
      <!-- space -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    11      -->
      <!-- arcane spell failure -->
      <fo:table-column column-width="2mm"/>           <!--    12      -->
      <!-- space -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    13      -->
      <!-- armour check-->
      <fo:table-column column-width="2mm"/>           <!--    14      -->
      <!-- space -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    15      -->
      <!-- SR -->
      <fo:table-column column-width="2mm"/>           <!--    16      -->
      <!-- space -->

      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    17      -->
      <!-- Acid Resistance -->
      <fo:table-column column-width="2mm"/>           <!--    18      -->
      <!-- space -->

      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    19      -->
      <!-- Cold Resistance -->
      <fo:table-column column-width="2mm"/>           <!--    20      -->
      <!-- space -->

      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    21      -->
      <!-- Electricity Resistance -->
      <fo:table-column column-width="2mm"/>           <!--    22      -->
      <!-- space -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    23      -->
      <!-- Fire Resistance -->

      <fo:table-column column-width="2mm"/>           <!--    24      -->
      <!-- space -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.37 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
      </fo:table-column>              <!--    25      -->
      <!-- Speed -->




      <fo:table-body>
        <fo:table-row height="2pt">

          <fo:table-cell/>
        </fo:table-row>
        <fo:table-row>

          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'initiative.title'"/>
            </xsl:call-template>
            <fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">INITIATIVE</fo:block>
            <fo:block line-height="4pt" font-size="4pt">modifier</fo:block>
          </fo:table-cell>                <!--    1       -->
          <fo:table-cell/>                <!--    2       -->
          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'initiative.total'"/>
            </xsl:call-template>
            <fo:block space-before.optimum="2pt" font-size="10pt">
              <xsl:value-of select="total"/>
            </fo:block>
          </fo:table-cell>                <!--    3       -->
          <fo:table-cell>
            <fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">=</fo:block>
          </fo:table-cell>                <!--    4       -->
          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'initiative.general'"/>
            </xsl:call-template>
            <fo:block space-before.optimum="2pt" font-size="10pt">
              <xsl:value-of select="dex_mod"/>
            </fo:block>
          </fo:table-cell>                <!--    5       -->
          <fo:table-cell>
            <fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">+</fo:block>
          </fo:table-cell>                <!--    6       -->
          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'initiative.general'"/>
            </xsl:call-template>
            <fo:block space-before.optimum="2pt" font-size="10pt">
              <xsl:value-of select="misc_mod"/>
            </fo:block>
          </fo:table-cell>                <!--    7       -->
          <fo:table-cell/>                <!--    8       -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'miss_chance'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <!-- Miss chance -->
            </fo:block>
          </fo:table-cell>                <!--    9       -->
          <fo:table-cell/>                <!--    10      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'spell_failure'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="spell_failure"/>
            </fo:block>
          </fo:table-cell>                <!--    11      -->
          <fo:table-cell/>                <!--    12      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'ac_check'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="check_penalty"/>
            </fo:block>
          </fo:table-cell>                <!--    13      -->
          <fo:table-cell/>                <!--    14      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'spell_resistance'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="spell_resistance"/>
            </fo:block>
          </fo:table-cell>                <!--    15      -->

          <fo:table-cell/>                <!--    14      -->

          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'spell_resistance'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:if test="resistances/acid > 0">
                <xsl:value-of select="resistances/acid"/>
              </xsl:if>
            </fo:block>
          </fo:table-cell>                <!--    15      -->
          <fo:table-cell/>                <!--    14      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'spell_resistance'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:if test="resistances/cold > 0">
                <xsl:value-of select="resistances/cold"/>
              </xsl:if>
            </fo:block>
          </fo:table-cell>                <!--    15      -->
          <fo:table-cell/>                <!--    14      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'spell_resistance'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:if test="resistances/electricity > 0">
                <xsl:value-of select="resistances/electricity"/>
              </xsl:if>
            </fo:block>
          </fo:table-cell>                <!--    15      -->
          <fo:table-cell/>                <!--    14      -->
          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'spell_resistance'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:if test="resistances/fire > 0">
                <xsl:value-of select="resistances/fire"/>
              </xsl:if>
            </fo:block>
          </fo:table-cell>                <!--    15      -->

          <fo:table-cell/>                <!--    24      -->

          <fo:table-cell display-align="center">
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'speed'"/>
            </xsl:call-template>
            <fo:block font-size="10pt">
              <xsl:value-of select="/character/basics/move/all"/>
              <xsl:value-of select="/character/basics/move/move/maneuverability"/>
            </fo:block>
          </fo:table-cell>                <!--    25      -->



        </fo:table-row>
        <!--                            <fo:table-row height="0.5pt"/>  -->
        <!-- Label Row -->
        <fo:table-row>

          <fo:table-cell/>                <!--    1       -->
          <fo:table-cell/>                <!--    2       -->
          <fo:table-cell>
            <fo:block text-align="center" space-before.optimum="1pt" font-size="6pt">TOTAL</fo:block>
          </fo:table-cell>                <!--    3       -->
          <fo:table-cell/>                <!--    4       -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">DEX MODIFIER</fo:block>
          </fo:table-cell>                <!--    5       -->
          <fo:table-cell/>                <!--    6       -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">MISC MODIFIER</fo:block>
          </fo:table-cell>                <!--    7       -->
          <!-- New Stuff  -->
          <fo:table-cell/>                <!--    8       -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">MISS CHANCE</fo:block>
          </fo:table-cell>                <!--    9       -->
          <fo:table-cell/>                <!--    10      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">Arcane Spell Failure</fo:block>
          </fo:table-cell>                <!--    11      -->
          <fo:table-cell/>                <!--    12      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">ARMOR CHECK PENALTY</fo:block>
          </fo:table-cell>                <!--    13      -->
          <fo:table-cell/>                <!--    14      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">SPELL RESIST</fo:block>
          </fo:table-cell>                <!--    15      -->

          <fo:table-cell/>                <!--    14      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">ACID RESIST</fo:block>
          </fo:table-cell>                <!--    15      -->
          <fo:table-cell/>                <!--    14      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">COLD RESIST</fo:block>
          </fo:table-cell>                <!--    15      -->
          <fo:table-cell/>                <!--    14      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">ELECT. RESIST</fo:block>
          </fo:table-cell>                <!--    15      -->
          <fo:table-cell/>                <!--    14      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">FIRE RESIST</fo:block>
          </fo:table-cell>                <!--    15      -->

          <fo:table-cell/>                <!--    24      -->
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">SPEED</fo:block>
          </fo:table-cell>                <!--    25      -->










        </fo:table-row>
      </fo:table-body>
    </fo:table>
    <!-- END ini-base table -->
  </xsl:template>

  <!--            NOT USED
       ====================================
       ====================================
       TEMPLATE - Base Attack TABLE
       ====================================
       ====================================-->
  <xsl:template match="bab" mode="bab">
    <!-- BEGIN ini-base table -->
    <fo:table table-layout="fixed">
      <!-- 0.26 * $pagePrintableWidth - 2 mm -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.44 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
      </fo:table-column>
      <fo:table-column column-width="2mm"/>
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.56 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
      </fo:table-column>
      <fo:table-body>
        <fo:table-row height="2pt">

          <fo:table-cell/>
        </fo:table-row>
        <fo:table-row>

          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'bab.title'"/>
            </xsl:call-template>
            <fo:block line-height="10pt" font-weight="bold" font-size="7.5pt">BASE ATTACK</fo:block>
            <fo:block line-height="4pt" font-size="4pt">bonus</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'bab.total'"/>
            </xsl:call-template>
            <fo:block space-before.optimum="2pt" font-size="10pt">
              <xsl:call-template name="process.attack.string">
                <xsl:with-param name="bab" select="."/>
                <xsl:with-param name="maxrepeat" select="4"/>
              </xsl:call-template>
              <!-- What is this?-->                                                   <!--xsl:value-of select="../../attack/melee/base_attack_bonus"/-->
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
    <!-- END ini-base table -->
  </xsl:template>

  <!--
      ====================================
      ====================================
      TEMPLATE - encumbrance TABLE
      ====================================
      ====================================-->
  <xsl:template name="encumbrance">
    <!-- BEGIN encumbrance table -->
    <!--    <xsl:if test="/character/equipment/total/load != 'Light'">      -->
    <fo:table table-layout="fixed">
      <!-- 0.26 * $pagePrintableWidth - 2 mm -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.50 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
      </fo:table-column>
      <fo:table-column column-width="2mm"/>
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.50 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
      </fo:table-column>
      <fo:table-body>
        <fo:table-row height="0pt">

          <fo:table-cell/>
        </fo:table-row>
        <fo:table-row>

          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'initiative.title'"/>
            </xsl:call-template>
            <fo:block line-height="10pt" font-weight="bold" font-size="7pt" space-before="0pt">Encumbrance</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'initiative.total'"/>
            </xsl:call-template>
            <xsl:if test="(/character/equipment/total/load = 'Medium' or /character/equipment/total/load = 'Heavy' or /character/equipment/total/load = 'Overload')">
              <fo:block font-size="10pt" font-weight="bold" color="red">
                <xsl:value-of select="/character/equipment/total/load"/>
                <fo:inline font-size="6" font-weight="italics"> (rules applied)</fo:inline>
              </fo:block>
            </xsl:if>
            <xsl:if test="/character/equipment/total/load = 'Light'">
              <fo:block space-before.optimum="2pt" font-size="10pt">
                <xsl:value-of select="/character/equipment/total/load"/>
              </fo:block>
            </xsl:if>

          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
    <!--    </xsl:if>       -->
    <!-- END encumberance table -->
  </xsl:template>

  <!--
      ====================================
      ====================================
      TEMPLATE - Resistance TABLE
      ====================================
      ====================================-->
  <xsl:template name="resistances">
    <!-- BEGIN Resistance table -->
    <fo:table table-layout="fixed">
      <!-- 0.26 * $pagePrintableWidth - 2 mm -->
      <fo:table-column>
        <xsl:attribute name="column-width"><xsl:value-of select="0.50 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
      </fo:table-column>
      <fo:table-body>
        <fo:table-row height="2pt">

          <fo:table-cell/>
        </fo:table-row>
        <fo:table-row>

          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'initiative.title'"/>
            </xsl:call-template>
            <fo:block line-height="10pt" font-weight="bold" font-size="7pt" space-before="1pt">Res</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell>
            <xsl:call-template name="attrib">
              <xsl:with-param name="attribute" select="'initiative.total'"/>
            </xsl:call-template>
            <fo:block space-before.optimum="2pt" font-size="8pt">
              <xsl:value-of select="resistance"/>
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
    <!--    </xsl:if>       -->
    <!-- END Resistance table -->
  </xsl:template>

  <!--
      ====================================
      ====================================
      TEMPLATE - SAVES TABLE
      ====================================
      ====================================-->
  <xsl:template match="saving_throws">
    <!-- BEGIN Saves table -->
    <fo:table table-layout="fixed" space-before="2mm">
      <fo:table-column column-width="82mm"/>  <!-- Saves Row -->
      <fo:table-column column-width="2mm"/>   <!-- Spacer -->
      <fo:table-column>
        <xsl:attribute name="column-width">73mm<!-- <xsl:value-of select="0.55 * $pagePrintableWidth - 86" />mm --></xsl:attribute>
      </fo:table-column>
      <fo:table-body>
        <fo:table-row>

          <fo:table-cell>
            <xsl:apply-templates select="." mode="saves"/>
          </fo:table-cell>
          <fo:table-cell/>
          <!--    Square Box Conditional Save area that we no longer need
               <fo:table-cell padding-start="1pt">
               <xsl:call-template name="attrib">
               <xsl:with-param name="attribute" select="'border'"/>
               </xsl:call-template>
               <fo:block font-size="4pt">Resistance</fo:block>
               <xsl:for-each select="resistances">
               <fo:block font-size="4pt" space-before.optimum="1pt"><xsl:value-of select="description"/></fo:block>
               </xsl:for-each>
               </fo:table-cell>                -->
        </fo:table-row>
      </fo:table-body>
    </fo:table>
    <!-- END Saves table -->
  </xsl:template>
  <!--
      ====================================
      ====================================
      TEMPLATE - SAVES TABLE
      ====================================
      ====================================-->
  <xsl:template match="saving_throws" mode="saves">
    <!-- BEGIN Saves table -->
    <fo:table table-layout="fixed">
      <fo:table-column column-width="23mm"/>
      <fo:table-column column-width="2mm"/>
      <fo:table-column column-width="7mm"/>
      <fo:table-column column-width="2mm"/>
      <fo:table-column column-width="7mm"/>
      <fo:table-column column-width="2mm"/>
      <fo:table-column column-width="6mm"/>
      <fo:table-column column-width="2mm"/>
      <fo:table-column column-width="6mm"/>
      <fo:table-column column-width="2mm"/>
      <fo:table-column column-width="6mm"/>
      <fo:table-column column-width="2mm"/>
      <fo:table-column column-width="6mm"/>
      <fo:table-body>
        <fo:table-row>

          <fo:table-cell>
            <fo:block text-align="center" space-before.optimum="1pt" font-size="6pt">SAVING THROWS</fo:block>
          </fo:table-cell>
          <fo:table-cell number-columns-spanned="3">
            <fo:block text-align="center" space-before.optimum="1pt" font-size="6pt">TOTAL</fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">BASE SAVE</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">ABILITY</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">MAGIC</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">MISC</fo:block>
          </fo:table-cell>
          <fo:table-cell/>
          <fo:table-cell>
            <fo:block text-align="center" font-size="4pt">EPIC</fo:block>
          </fo:table-cell>
        </fo:table-row>
        <xsl:for-each select="saving_throw">
          <fo:table-row space-before="2pt">

            <fo:table-cell>
              <xsl:call-template name="attrib">
                <xsl:with-param name="attribute" select="'saves.title'"/>
              </xsl:call-template>
              <fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">
                <xsl:value-of select="translate(name/long, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
              </fo:block>
              <fo:block line-height="4pt" font-size="4pt">(<xsl:value-of select="ability"/>)</fo:block>
            </fo:table-cell>
            <fo:table-cell/>
            <fo:table-cell>
              <xsl:call-template name="attrib">
                <xsl:with-param name="attribute" select="'saves.total'"/>
              </xsl:call-template>
              <fo:block space-before.optimum="2pt" font-size="10pt">
                <xsl:value-of select="total"/>
              </fo:block>
            </fo:table-cell>
            <fo:table-cell>
              <fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">=</fo:block>
            </fo:table-cell>
            <xsl:call-template name="saves.entry"><xsl:with-param name="value" select="base"/></xsl:call-template>
            <xsl:call-template name="saves.entry"><xsl:with-param name="value" select="abil_mod"/></xsl:call-template>
            <xsl:call-template name="saves.entry"><xsl:with-param name="value" select="magic_mod"/></xsl:call-template>
            <xsl:call-template name="saves.entry"><xsl:with-param name="value" select="misc_mod"/></xsl:call-template>
            <xsl:call-template name="saves.entry">
              <xsl:with-param name="value" select="epic_mod"/>
              <xsl:with-param name="with-plus">false</xsl:with-param>
            </xsl:call-template>
          </fo:table-row>
          <fo:table-row height="2pt">
            <xsl:message>Test END</xsl:message>
            <fo:table-cell>
              <fo:block>
              </fo:block>
            </fo:table-cell>

          </fo:table-row>
        </xsl:for-each>
      </fo:table-body>
    </fo:table>
  </xsl:template>
  <xsl:template name="saves.entry">
    <xsl:param name="value"/>
    <xsl:param name="with-plus">true</xsl:param>
      
    <fo:table-cell>
      <xsl:call-template name="attrib">
        <xsl:with-param name="attribute" select="'saves'"/>
      </xsl:call-template>
      <fo:block space-before.optimum="2pt" font-size="10pt">
        <xsl:value-of select="$value"/>
      </fo:block>
    </fo:table-cell>
      <xsl:if test="$with-plus = 'true'">
        <fo:table-cell>
          <fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">+</fo:block>
        </fo:table-cell>
      </xsl:if>
  </xsl:template>




</xsl:stylesheet>
