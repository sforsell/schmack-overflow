$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

 $(".vote-button").on("submit", function( event){
   event.preventDefault();
  var $this = $(this);
  var data = {vote: $this.children().val()}

   $.ajax({
      url: $this.attr("action"),
      method: $this.attr("method"),
      data: data
   })
   .done(function(response){
    $($this).parent().find("span.score").text(response)
   })

 });

$(".comment-form").hide();

$(".new-comment-button").on("click",function() {
  var $this = $(this)
  $(".comment-form").hide();
  $(".new-comment-button").show();
   $this.hide();
   $this.siblings().show();
 });


$(".answer-form").on( "submit", function(event){
  event.preventDefault();
  var $this = $(this)

  $.ajax({
    url: $this.attr("action"),
    type: $this.attr("method"),
    data: $this.serialize()
  })
  .done(function(response){
    $(".answer-post-wrapper").append(response);
    });
  });

  $(".top-answer").on( "", function(event){
    event.preventDefault();
    

  })











});
