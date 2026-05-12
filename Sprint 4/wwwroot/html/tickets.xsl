<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <head>
  <link rel="stylesheet" href="../css/styles.css"/>
</head>
  <body>
  <center>
    <table class="tablaIframe">
      <tr class="bordeIframe">
        <th>ID</th>
        <th>Prioridad</th>
        <th>Usuario</th>
        <th>Asunto</th>
      </tr>
      <xsl:for-each select="TicketsSet/Ticket">
      <tr>
        <td><xsl:value-of select="@id"/></td>
        <td><xsl:value-of select="Priority"/></td>
        <td><xsl:value-of select="Requester"/></td>
        <td><xsl:value-of select="Subject"/></td>
      </tr>
      </xsl:for-each>
    </table>
    </center>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>