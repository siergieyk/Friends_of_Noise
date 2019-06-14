$(document).ready(function() {    
  
  slideShow(3000);

});

function slideShow(speed) {

  $('ul.slideshow').append('<li class="slideshow"></li>');

  $('ul.slideshow li').css({opacity: 0.0});  

  $('#slideshow').html($('ul.slideshow li.show').find('img').attr('alt'));    
   
  var time = setInterval('gallery()', speed);
  

  $('ul.slideshow').hover(
   
    function () {
      clearInterval(time); 
    },  
    function () {
      time = setInterval('gallery()', speed);     
    }
  );  
}

function gallery() {

  var current = ($('ul.slideshow li.show')?  $('ul.slideshow li.show') : $('#ul.slideshow li:first'));

  if(current.queue('fx').length == 0) {

    var next = ((current.next().length) ? ((current.next().attr('id') == 'slideshow')? $('ul.slideshow li:first') :current.next()) : $('ul.slideshow li:first'));

    var desc = next.find('img').attr('alt');  
 
    next.css({opacity: 0.0}).addClass('show').animate({opacity: 1.0}, 1000);
 
    current.animate({opacity: 0.0}, 1000).removeClass('show');

  }
}