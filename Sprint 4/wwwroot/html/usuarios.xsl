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
        <th>Nombre</th>
        <th>Email</th>
      </tr>
      <xsl:for-each select="usuarios/usuario">
      <tr>
        <td><xsl:value-of select="id"/></td>
        <td><xsl:value-of select="display_name"/></td>
        <td><xsl:value-of select="user_email"/></td>
      </tr>
      </xsl:for-each>
    </table>
    </center>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
