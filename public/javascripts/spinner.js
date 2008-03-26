
// Run a spinner when an AJAX request in running...
var ComatoseAJAXSpinner = {
  busy : function () {
    if($('spinner') && Ajax.activeRequestCount > 0) {
      Effect.Appear('spinner',{duration:0.5,queue:'end'});
    }
  },

  notBusy: function() {
    if($('spinner') && Ajax.activeRequestCount == 0) {
      Effect.Fade('spinner',{duration:0.5,queue:'end'});
    }
  }  
}
// Register it with Prototype...
Ajax.Responders.register({
  onCreate: ComatoseAJAXSpinner.busy, 
  onComplete: ComatoseAJAXSpinner.notBusy
});
