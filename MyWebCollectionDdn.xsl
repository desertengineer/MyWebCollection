<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>
    <title>My dropdown Updates</title>
    <link rel="stylesheet" href=" MyWebCollection.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>

<div class="main">

<h1>Hello Moulay!</h1>
<hr/>

<h2>Collection Updates</h2>

<div id="myBtnContainer">
  <button class="btn active" data-categ="all" onclick="filterSelection(this)" title="Click to show all categories">Show All</button>
  <xsl:for-each select="Gallery/Categories/Category">
    <div class="dropdown">
        <button class="dropbtn"><xsl:value-of select="@id"/> 
        <i class="fa fa-caret-down"></i>
        </button>
        <xsl:variable name="myCategory" select="@id"/> 
        <div class="dropdown-content">
            <xsl:for-each select="/Gallery/Buttons/Button "> 
                <xsl:if test="Category=$myCategory">
                    <a href="javascript:void(0);" class="{Class}" data-categ= "{Data}" onclick="{OnClick}"><xsl:value-of select="Text"/> </a>
                </xsl:if>
            </xsl:for-each>  
        </div>
    </div>   
  </xsl:for-each>

  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myResponsive()">&#9776;</a>
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
<script>
    function myResponsive() {
      var x = document.getElementById("myTopnav");
      if (x.className === "topnav") {
        x.className += " responsive";
      } else {
        x.className = "topnav";
      }
    }
    </script>
<!-- END MAIN -->
</div>
<script src="MyWebCollection.js"></script> 
</body>
</html>
</xsl:template>

</xsl:stylesheet>