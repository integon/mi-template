<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml"></xsl:output>

    <xsl:template match="asfdasdfasfd" >
        <text xmlns="http://ws.apache.org/commons/ns/payload">
            <xsl:text>{"test": "test"}</xsl:text>
        </text>
        <!--<xsl:text>{"test": "test"}</xsl:text>-->
    </xsl:template>

     <xsl:template match="sfaewerasdf" >
             <xsl:text>{"test": "test"}</xsl:text>
    </xsl:template>

    <xsl:template match="/*" >
        <jsonElement>
            <xsl:text>{"test": "test"}</xsl:text>
        </jsonElement>
    </xsl:template>

    <xsl:template match="/asdf" >
        <text xmlns="http://ws.apache.org/commons/ns/payload">
            <xsl:text>{"test": "test"}</xsl:text>
        </text>

    </xsl:template>
</xsl:stylesheet>