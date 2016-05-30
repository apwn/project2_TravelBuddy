$(function() {

  $('.name i').click(function(){
      $('.name').hide();
      $('.name-edit').fadeIn('slow').css('display', 'flex');
  });

  $('.email i').click(function(){
      $('.email').hide();
      $('.email-edit').fadeIn('slow').css('display', 'flex');
  });

  $('.show-pwd').click(function(){
      $('.password-edit').fadeIn('slow').css('display', 'block');
  });

});
