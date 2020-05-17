window.onload = function(){
  jQuery(function($) {
      $('.cover_image').bgSwitcher({
          images:['assets/revolution_square.jpg','assets/tajimahal.JPG','assets/fullzamami.JPG'],
          interval: 5000,
          loop: true,
          duration: 3000,
      });
  });

  $(".cover_image").bgswitcher("next");
}