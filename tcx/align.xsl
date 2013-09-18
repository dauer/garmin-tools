<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:garmin="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2"
    xmlns="http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2">

    <!-- Specify the 'align' parameter on CLI-->
    <xsl:param name="align">0</xsl:param>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="garmin:Track | garmin:Trackpoint | garmin:Position">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="garmin:TotalTimeSeconds | garmin:DistanceMeters | garmin:MaximumSpeed | garmin:Calories | garmin:Intensity | garmin:TriggerMethod | garmin:Time | garmin:AltitudeMeters | garmin:Position/node()">
        <xsl:element name="{local-name()}">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>

    <xsl:template match="garmin:Trackpoint/garmin:DistanceMeters">
        <xsl:element name="DistanceMeters">
            <!-- Calculate new distance in meters -->
            <xsl:value-of select="format-number(. - $align, '0.#####')" />
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
