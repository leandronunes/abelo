<!--

/*
Configure menu styles below
NOTE: To edit the link colors, go to the STYLE tags and edit the ssm2Items colors
*/
YOffset=150; // no quotes!!
XOffset=0;
staticYOffset=30; // no quotes!!
slideSpeed=20 // no quotes!!
waitTime=100; // no quotes!! this sets the time the menu stays out for after the mouse goes off it.
menuBGColor="black";
menuIsStatic="yes"; //this sets whether menu should stay static on the screen
menuWidth=150; // Must be a multiple of 10! no quotes!!
menuCols=2;
hdrFontFamily="verdana";
hdrFontSize="2";
hdrFontColor="white";
hdrBGColor="#170088";
hdrAlign="left";
hdrVAlign="center";
hdrHeight="15";
linkFontFamily="Verdana";
linkFontSize="2";
linkBGColor="white";
linkOverBGColor="#FFFF99";
linkTarget="_top";
linkAlign="Left";
barBGColor="#444444";
barFontFamily="Verdana";
barFontSize="2";
barFontColor="white";
barVAlign="center";
barWidth=20; // no quotes!!
barText="SIDE MENU"; // <IMG> tag supported. Put exact html for an image to show.

///////////////////////////

// ssmItems[...]=[name, link, target, colspan, endrow?] - leave 'link' and 'target' blank to make a header
ssmItems[0]=["Menu"] //create header
ssmItems[1]=["Dynamic Drive", "http://www.dynamicdrive.com", ""]
ssmItems[2]=["What's New", "http://www.dynamicdrive.com/new.htm",""]
ssmItems[3]=["What's Hot", "http://www.dynamicdrive.com/hot.htm", ""]
ssmItems[4]=["Message Forum", "http://www.codingforums.com", "_new"]
ssmItems[5]=["Submit Script", "http://www.dynamicdrive.com/submitscript.htm", ""]
ssmItems[6]=["Link to Us", "http://www.dynamicdrive.com/link.htm", ""]

ssmItems[7]=["FAQ", "http://www.dynamicdrive.com/faqs.htm", "", 1, "no"] //create two column row
ssmItems[8]=["Email", "http://www.dynamicdrive.com/contact.htm", "",1]

ssmItems[9]=["External Links", "", ""] //create header
ssmItems[10]=["JavaScript Kit", "http://www.javascriptkit.com", ""]
ssmItems[11]=["Freewarejava", "http://www.freewarejava.com", ""]
ssmItems[12]=["Coding Forums", "http://www.codingforums.com", ""]

buildMenu();

//-->