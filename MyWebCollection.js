var xml ,xsl;
function getContents()
{
	//console.log("Hello"); 
	 xml = loadXMLDoc("./MyWebCollection.xml");
	 xsl = loadXMLDoc("./MyWebCollection.xsl");

	setTimeout(startUp(),5000);
}

function addAttr(elems,attr,attrVal) {
   var bound=elems.length;
  for (let index = 0; index < bound; index++) {
    document.querySelectorAll(".content a")[index].setAttribute(attr,attrVal);
  }
}

function filterSelection(elem) {
  var x,c, i;
  x = document.getElementsByClassName("column");
  c = elem.getAttribute("data-categ");
  //console.log(c);
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}

function startUp() {
  //setTimeout(console.log(xsl),5000);
// code for IE
if (window.ActiveXObject || xhttp.responseType == "msxml-document")
	{
	ex = xml.transformNode(xsl);
	document.getElementById("myDoc").innerHTML = ex;
	}
// code for Chrome, Firefox, Opera, etc.
else if (document.implementation && document.implementation.createDocument)
	{
	xsltProcessor = new XSLTProcessor();
	xsltProcessor.importStylesheet(xsl);
	resultDocument = xsltProcessor.transformToFragment(xml, document); 
	document.getElementById('myDoc').appendChild(resultDocument);
	}
filterSelection(document.getElementsByClassName("active")[0]);
addAttr(document.querySelectorAll(".content a"),"target","_blank");
// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
    this.click();
  });
}
window.addEventListener("load", function(){  
  var bound = document.querySelectorAll(".content").length;  
for (let count = 0; count < bound; count++) { 
    var elemDir=document.querySelectorAll(".content")[count].getAttribute('dir');
    var elem=document.querySelectorAll(".content .fullStory")[count]; 
    if (elemDir=="rtl") { 
        elem.innerHTML="المزيد ...";      
    } 
    if (elemDir=="ltr") {
      elem.innerText="... More";
    }}
});
  
}
function loadXMLDoc(filename)
	{
	if (window.ActiveXObject)
		{
		xhttp = new ActiveXObject("Msxml2.XMLHTTP");
		}
	else
		{
		xhttp = new XMLHttpRequest();
		}
	xhttp.open("GET", filename, false);
	try {xhttp.responseType = "msxml-document"} catch(err) {} // Helping IE11
	xhttp.send("");
	//console.log(xhttp.responseXML); 
	return xhttp.responseXML;
	}
	
