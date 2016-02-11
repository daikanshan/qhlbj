//= require jquery
//= require jquery_ujs
//= require flat-ui
//= require unslider
//= require ckeditor/init
$(function() {
    unslider = $('.banner').unslider({
      animation: 'vertical',
      autoplay: true,
      arrows:false,
      dots:false,
      pause:true
    });
});
