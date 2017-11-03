function highlight() {
  $(".card").markRegExp(/([#])([a-z])\w+/gmi, {
    "element": "a",
    "className": "highlight",
    "each": function(element){
      text = element.text.slice(1)
      $(element).attr("href", `/tags/${text}`);
    }
  });
}


$( document ).on('turbolinks:load', function() {
  highlight()
});
