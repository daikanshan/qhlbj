//= require jquery
//= require jquery_ujs
//= require flat-ui
//= require ckeditor/init
jQuery.extend({
  once_click : function(base_url){
    $.set_delete_not_able();
    $.set_checked_all_not_able();
    $.set_view_and_edit_not_able();
    checked_ids = $.get_checked_ids();
    checked_num = checked_ids.length;
    all_num = $.get_all_num();
    if(checked_num==0){
      $.set_checked_all_not_able();
    }
    if(checked_num>=1){
      $.set_delete_able(ids,base_url);
      if(checked_num == all_num){
        $.set_checked_all_able();
      }
    }
    if (checked_num == 1){
      $.set_view_and_edit_able(ids[0],base_url);
    }
  },
  set_checked_all_able :function(){
    $("#check_all").prop("checked",true);
    // $("#check_all").iCheck('check');
  },
  set_checked_all_not_able :function(){
    $("#check_all").prop("checked",false);
    // $("#check_all").iCheck('uncheck');
  },
  get_all_num : function(){
    return $(".item_line").length;
  },
  get_checked_ids :function(){
    ids = new Array();
    $(".item_line").each(function(){
      current = $(this).find(".p_checkbox");
      if(current.prop("checked") == true){
        ids.push(current.attr("value"));
      }
    });
    return ids;
  },
  set_delete_able : function(ids,base_url){
    str = ids.join(",");
    $("#del").attr("href",base_url+str+"/destroy");
    $('#del').attr("data-method","delete");
    $('#del').removeAttr("disabled");
  },
  set_delete_not_able : function(){
    $('#del').attr("disabled","disabled");
    $('#del').removeAttr("data-method");
    $("#del").removeAttr("href");
  },
  set_view_and_edit_able : function(id,base_url){
    $("#view").attr("href",base_url+id);
    $('#view').removeAttr("disabled");
    $("#edit").attr("href",base_url+id+"/edit");
    $('#edit').removeAttr("disabled");
  },
  set_view_and_edit_not_able : function(){
    $('#view').attr("disabled","disabled");
    $("#view").removeAttr("href");
    $('#edit').attr("disabled","disabled");
    $("#edit").removeAttr("href");
  }
});

$(document).ready(function(){
  // options
  $('ul.subul').slideUp();
  $('li.current_controller').parent('ul').slideDown();

  $('ul.navs').children('li').click(function(){
    $(this).children('ul').slideToggle();
  })
  // end options

  // checkbox
  $('.p_checkbox').radiocheck('uncheck');
  base_url = $("#quick-option").attr("base-url")+'/';
  $("#check_all").click(function(){
    if($("#check_all").prop("checked") == true){
      $(".item_line").each(function(){
        $(this).find(".p_checkbox").prop("checked",true);
        // $(this).find(".p_checkbox").iCheck('check');
      })
    }else{
      $(".item_line").each(function(){
        $(this).find(".p_checkbox").prop("checked",false);
        // $(this).find(".p_checkbox").iCheck('uncheck');
      })
    }
    $.once_click(base_url);
  });
  $(".p_checkbox").click(function(){
    $.once_click(base_url);
  })
  $(".item_line").click(function(event){
    if(event.target.nodeName=="TD"){
      check_box = $(this).find(".p_checkbox");
      // 选中
      check_box.prop("checked",!check_box.prop("checked"));
      $.once_click(base_url);
      // $(this).find(".p_checkbox").iCheck('toggle');
    }
  });
  // end checkbox
})
