<!-- FIXME tratar este java script para verificar se existe a div antes de tratar o html-->
function scroolItemsTable() {
  var div = $("cumpom_sales");
  if ( ( div.scrollTop + div.clientHeight ) < div.scrollHeight ) {
    div.scrollTop++;
    setTimeout("scroolItemsTable()",50);
  }
}

