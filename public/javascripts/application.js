// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults



//tooltip display, use class .tooltip


$(document).ready(function() {

   $('.tooltip').tooltip({ 
    track: false, 
    delay: 500, 
    showURL: false, 
    showBody: " - ", 
    fade: 500
});
})




