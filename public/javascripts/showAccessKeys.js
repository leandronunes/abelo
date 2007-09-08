
function showAccessKeys(args) {

  if ( ! args.intro ) args.intro = "";
  if ( ! args.no_desc_txt ) args.no_desc_txt = "(no description)";
  
  var txt = "";

  $$("*").each( function(e) {
  
    if ( e.hasAttribute("accesskey") ) {
      txt += "Alt+"+ e.getAttribute("accesskey").toUpperCase() +"\t  ";
      // Defalut Description:
      var desc = args.no_desc_txt;
      // This tries will be overload for each more important sucess try...
      // Try to get it's textual value:
      if ( e.firstChild && e.firstChild.value ) desc = e.firstChild.value;
      // Try to get it's span value:
      if ( e.getElementsByTagName("span")[0] &&
           !/^\s*$/.test( e.getElementsByTagName("span")[0].innerHTML ) ) {
             desc = e.getElementsByTagName("span")[0].innerHTML.replace( /<[^>]*>/g, "" );
           }
      // Try to get the title value:
      if ( e.hasAttribute("title") ) desc = e.getAttribute("title");
      // Try to get the alternative text value:
      if ( e.hasAttribute("alt") ) desc = e.getAttribute("alt");
      // ...and finaly add the description:
      txt += desc + "\n";
    }
  
  });
  
  alert( args.intro +"\n\n"+ txt );

}

