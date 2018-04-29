function fadeIn() {
  $(window).on("scroll", function(e){
  var target = $(this).scrollTop();
  $(".fadeIn").each(function(i){
    if(target+200 > $(this).offset().top) {
      $(".fadeIn").eq(i).addClass("-scrollIn");
      $(".map").eq(i).addClass("-fadeIn");
    }
  })
  });
}

// function slideIn() {
//   var image = document.querySelectorAll(".img");
//   var map = document.querySelectorAll(".map");
//   TweenMax.staggerFrom(image, 0.5, {
//     x: 0,
//     delay: 1.5,
//     opacity: 1,
//     ease: Power4.easeIn
//   }, 0.5);
// }
document.addEventListener('DOMContentLoaded', function(){

  fadeIn();

  var trigger = new ScrollTrigger({
    toggle: {
      visible: 'visibleClass',
      hidden: 'hiddenClass'
    },
    offset: {
      x: 0,
      y: 20
    },
    addHeight: true,
    once: true
  }, document.body, window)

});

