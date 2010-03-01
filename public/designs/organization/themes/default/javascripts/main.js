function internalLink() {
	$('url').innerHTML = select + '<input type="hidden" value="" name="feature_option[url]" />';
}

function externalLink() {
	$('url').innerHTML = text + '<input type="hidden" value="" name="feature_option[redirect_id]" />';
}	

// Remove dotted border around links
function blurLink() { this.blur(); }
function linkFocus() {
  if (!document.getElementById) return;
  allLinks = document.getElementsByTagName("a");
  for ( i=0; i < allLinks.length; i++ ) {
    allLinks[i].onfocus = blurLink;
  }
}

window.onload = function() {
	linkFocus();
}

// Shows or hide 'target' by clicking on 'source'
function toggleView(source,target) {
	if (target.visible()) { 
		target.hide();
		source.update('[+]');
	} else {
		target.show();
		source.update('[-]');
	}
}

// Get selected values from a select field and returns as a string separating values by commas
function getSelectedValues(select) {
  selected = new Array();
  for (var i=0; i < select.options.length; i++) 
    if (select.options[i].selected) selected.push(select.options[i].value);
  return selected.join(',')
}

// Turn highlight on or off
function toggleHighlight(container) {
  if ($(container).hasClassName('highlight-on')) {
    $(container).addClassName('highlight-off');
    $(container).removeClassName('highlight-on');
  } else {
    $(container).addClassName('highlight-on');
    $(container).removeClassName('highlight-off');
  }
}

// Check/Uncheck all checkboxes inside an element
function toggleCheckboxes(container) {
  if ($(container).hasClassName('checkboxes-checked')) {
    $(container).addClassName('checkboxes-unchecked');
    $(container).removeClassName('checkboxes-checked');
    $$('#' + container + ' input[type=checkbox]').each( function(c) { c.checked = false; } );
  } else {
    $(container).addClassName('checkboxes-checked');
    $(container).removeClassName('checkboxes-unchecked');
    $$('#' + container + ' input[type=checkbox]').each( function(c) { c.checked = true; } );
  }
}
