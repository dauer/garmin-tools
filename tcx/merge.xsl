<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2" xmlns:garmin="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2" exclude-result-prefixes="#default">

    <!-- Parameter via CLI -->
    <xsl:param name="files" />

    <xsl:template match="/garmin:TrainingCenterDatabase">
        <TrainingCenterDatabase>
            <Activities>
                <Activity>
                    <!-- Get Activity @Sport and Id from the specified "main" .tcx file-->
                    <xsl:attribute name="Sport">
                        <xsl:value-of select="./garmin:Activities/garmin:Activity/@Sport" />
                    </xsl:attribute>
                    <Id>
                        <xsl:value-of select="./garmin:Activities/garmin:Activity/garmin:Id" />
                    </Id>
                    <xsl:for-each select="tokenize($files, ',')">
                        <!-- Copy Laps from specified .tcx files -->
                        <xsl:copy-of select="document(.)/garmin:TrainingCenterDatabase/garmin:Activities/garmin:Activity/garmin:Lap" />
                    </xsl:for-each>
                </Activity>
            </Activities>
        </TrainingCenterDatabase>
    </xsl:template> 

</xsl:stylesheet>
