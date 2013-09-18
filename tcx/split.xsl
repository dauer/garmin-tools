<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:garmin="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2" xmlns="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2" exclude-result-prefixes="#default">

    <xsl:template match="/garmin:TrainingCenterDatabase">
        <xsl:for-each select="./garmin:Activities/garmin:Activity">
            <xsl:variable name="sport" select="@Sport"/>
                <xsl:for-each select="./garmin:Lap">
                    <xsl:variable name="lap" select="position()"/>
                    <xsl:variable name="year" select="year-from-dateTime(@StartTime)" />
                    <xsl:variable name="month" select="month-from-dateTime(@StartTime)" />
                    <xsl:variable name="day" select="day-from-dateTime(@StartTime)" />
                    <xsl:result-document method="xml" href="{$sport}-{$year}-{$month}-{$day}-lap-{$lap}.tcx">
                        <TrainingCenterDatabase>
                            <Activities>
                                <Activity Sport="{$sport}">
                                    <Id><xsl:value-of select="../garmin:Id" /></Id>
                                    <Lap>
                                        <xsl:attribute name="StartTime">
                                            <xsl:value-of select="@StartTime" />
                                        </xsl:attribute>
                                        <xsl:copy-of select="node()" />
                                    </Lap>
                                </Activity>
                           </Activities>
                       </TrainingCenterDatabase>
                    </xsl:result-document>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template> 

</xsl:stylesheet>
