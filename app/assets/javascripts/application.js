// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.dd.min
//= require turbolinks
//= require_tree .

$(function () {
    if ($('#messages').length > 0) {
        scrollBottom();
        //setTimeout(updateMessages, 5000);
    }

    $('#new_message_char .message_content').keypress(function(e){
        if((e.keyCode == 10 || e.keyCode == 13) && e.ctrlKey){
            $(this).val($(this).val() + "\n");
        }else if(e.which == 13){
            $('#new_message_char').submit();
        }
    });

    $('#new_message_ooc .message_content').keypress(function(e){
        if((e.keyCode == 10 || e.keyCode == 13) && e.ctrlKey){
            $(this).val($(this).val() + "\n");
        }else if(e.which == 13){
            $('#new_message_ooc').submit();
        }
    });

    try {
        $(".char_select").msDropDown().data("dd");
    } catch(e) {
        console.log("Error: "+e.message);
    }
});

function scrollBottom(){
    //console.log($('#messages').get(0).scrollHeight)
    $('#messages').scrollTop($('#messages').get(0).scrollHeight);
}

function updateMessages() {
    var room_id = $('#room').attr('data-id');
    //console.log($('.message').length)
    //console.log($('.message:last').attr('data-time'))
    var after = ($('.message').length > 0) ? $('.message:last').attr('data-time') : 0;
    $.getScript('/messages.js?room_id=' + room_id + "&after=" + after);
    setTimeout(updateMessages, 5000);
}