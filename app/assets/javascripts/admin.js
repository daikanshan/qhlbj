//= require jquery
//= require jquery_ujs
//= require flat-ui
$(document).ready(function(){
  // options
  $('ul.subul').hide();
  $('ul.navs').children().click(function(){
    $('ul.subul').slideUp();
    if($(this).children().first().is(":hidden")){
      $(this).children().slideDown();
    }
  })
})
