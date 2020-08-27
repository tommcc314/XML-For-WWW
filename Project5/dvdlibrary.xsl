<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 5
   Tutorial Project

   DVD Library XSLT Style Sheet
   Author: Tom McCarthy
   Date: 07/03/2020  

   Filename:         dvdlibrary.xsl
   
-->

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Jenna's DVD Collection</title>
                <link href="dvdlibrarystyles.css"
                rel="stylesheet" type="text/css" />
            </head>
            <body>
                <header>
                    <h1>Jenna's DVD Collection</h1>
                </header>
                <section>
                    <h1>DVD List</h1>
                    <xsl:apply-templates select="dvdlibrary"/>
                </section>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="dvdlibrary">
        <xsl:for-each select="dvd"> 
            <xsl:sort select="title"/>      
            <article>          
                <h1>
                    <xsl:value-of select="title" />
                </h1>
                <h2>Featuring:
                    <xsl:apply-templates select="characters" />
                </h2>
                <p>Bonus Features:  
                    <span>
                        <xsl:apply-templates select="bonus" />
                    </span>
                </p>
                <table>
                    <tr>
                        <th>Price</th>
                        <th>Location</th>
                        <th>Date</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="purchased/price" />
                        </td>
                        <td>
                            <xsl:value-of select="purchased/location" />
                        </td>
                        <td>
                            <xsl:value-of select="purchased/date" />
                        </td>
                    </tr>
                </table>
            </article>
        </xsl:for-each>       
    </xsl:template>
    <xsl:template match="characters">
        <xsl:for-each select="character">
            [ <xsl:value-of select="." /> ]
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="bonus">
        <xsl:for-each select="feature">
            <xsl:value-of select="." />/
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>