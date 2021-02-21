// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start() //ターボリンクス
require("@rails/activestorage").start()
require("channels")
require("jquery")
import 'bootstrap'
import '../../assets/stylesheets/application.scss'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// jQuery
$(function(){
  //メニューバーの表示
  $('header .fa-bars').on('click', function(){
    $('.header_contents').slideToggle('fast');
  });
  //トークメニューの表示
  $('.talk-title .fa-ellipsis-h').on('click', function(){
    $('.talk-menu').slideToggle('fast');
  });
  // トークモーダルの表示非表示
  $('#open-invite-modal').on('click', function(){
    $('.talk-modal-back').fadeIn('fast');
    $('.talk-invite').fadeIn('fast');
  });  

  $('#close-modal').on('click', function(){
    $('.talk-modal-back').fadeOut('fast');
    $('.talk-invite').fadeOut('fast');
  });  

    // 問合せモーダルの表示非表示

  $('#open-inquiry-form').on('click', function(){
    $('.inquiry-modal-back').fadeIn('fast');
    $('.inquiry-form').fadeIn('fast');
  });  

  $('#close-inquiry-modal-1').on('click', function(){
    $('.inquiry-modal-back').fadeOut('fast');
    $('.inquiry-form').fadeOut('fast');
  });  

    // 問合せモーダルの表示非表示2

    $('#open-inquiry-form-2').on('click', function(){
      $('.inquiry-modal-back').fadeIn('fast');
      $('.inquiry-form-2').fadeIn('fast');
    });  
  
    $('#close-inquiry-modal-2').on('click', function(){
      $('.inquiry-modal-back').fadeOut('fast');
      $('.inquiry-form-2').fadeOut('fast');
    });  

      
    // ブロック解除モーダルの表示非表示
    $('#open-release-form').on('click', function(){
      $('.inquiry-modal-back').fadeIn('fast');
      $('.release-form').fadeIn('fast');
    });  
  
    $('#close-inquiry-modal-3').on('click', function(){
      $('.inquiry-modal-back').fadeOut('fast');
      $('.release-form').fadeOut('fast');
    });  

  
    // 退会モーダルの表示非表示
    $('#open-delete-form').on('click', function(){
      $('.inquiry-modal-back').fadeIn('fast');
      $('.delete-form').fadeIn('fast');
    });  
  
    $('#close-inquiry-modal-4').on('click', function(){
      $('.inquiry-modal-back').fadeOut('fast');
      $('.delete-form').fadeOut('fast');
    });

    // headerメッセージのフェイドアウト
    $(".header_notice").delay(1000).fadeOut('fast');
    $(".header_warning").delay(2500).fadeOut('fast');
});
