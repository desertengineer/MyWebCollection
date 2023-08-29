<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>
    <title>My Updates</title>
    <link rel="stylesheet" href=" MyWebCollection.css"/>
</head>
<body>

<div class="main">

<h1>Hello Moulay!</h1>
<hr/>

<h2>Collection Updates</h2>

<div id="myBtnContainer">
  <button class="btn active" data-categ="all" onclick="filterSelection(this)" title="Click to show all categories">Show all</button>
                 
  <xsl:for-each select="Gallery/Buttons/Button">
    <button class="{Class}" data-categ= "{Data}" onclick="{OnClick}"> <xsl:value-of select="Text"/></button>
  </xsl:for-each>

</div>

<!-- Portfolio Gallery Grid -->
<div class="row">
  <xsl:for-each select="Gallery/Cards/Card"> 
  <div class="{Class}">
    <div class="content" dir="{dir}">
	<span class="sourceName"><xsl:value-of select="Website"/></span>
    <a href="{Href}">
        <img src="{Src}"/>
         <h4><xsl:value-of select="H4"/></h4>
      </a>
      <p><span class="story"><xsl:value-of select="P"/></span><a href="{Href}"><span class="fullStory"></span></a></p>
    </div>
  </div>
</xsl:for-each>
 
<!-- END GRID -->
</div>

<!-- END MAIN -->
</div>
<script src="MyWebCollection.js"></script> 
</body>
</html>
</xsl:template>

</xsl:stylesheet>