$(document).on('turbolinks:load', function() {
  $('.slider').slick({
    autoplay:true, //自動スライド//
    autoplaySpeed:1500, //スライド切り替え時間//
    speed:1500, //スライド動き速度//
    centerMode: true,
    centerPadding: '5%',
    dots:true // インジケーターを表示
  });
});
