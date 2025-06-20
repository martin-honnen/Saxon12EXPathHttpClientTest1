<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:http="http://expath.org/ns/http-client"
                exclude-result-prefixes="#all"
                expand-text="yes">

    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="request" as="element(http:request)">
        <http:request href="https://httpbin.org/xml" method="GET" default-charset="utf-8">
            <http:header name="Accept" value="application/xml"/>
            <http:header name="Accept-Encoding" value="utf-8"/>
            <http:header name="Authorization" value="Basic YWxhZGRpbjpvcGVuc2VzYW1l"/>
        </http:request>
    </xsl:param>


    <xsl:template match="/" name="xsl:initial-template">
        <xsl:sequence select="let $response := http:send-request($request)
                              return if ($response[1]/http:response/@status = 200)
                                     then $response[2]
                                     else $response[1]"/>
    </xsl:template>

</xsl:stylesheet>
