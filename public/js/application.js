$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

 $(".vote_button").on("submit", function( event){
   event.preventDefault();
  var $this = $(this);

  var data = {vote: $this.children().val()}
   $.ajax({
      url: $this.attr("action"),
      method: $this.attr("method"),
      data: data
   })
   .done(function(response){
    $($this.parent().find("span")).text(response)
   })
 });

});
