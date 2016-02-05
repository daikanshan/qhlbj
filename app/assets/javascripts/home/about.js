$(function() {
    unslider = $('.banner_about').unslider({
      autoplay: false,
      arrows:false,
      dots:false,
      pause:true
    });
    data = unslider.data('unslider');
    $('.option').each(function(){
      $(this).on('click',function(){
        data.move($(this).attr("value"));
      });
    })
});
