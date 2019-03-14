$(function () {
    var slides = $('.slideshow>li');
    var slidecount = 0;
    var totalslide = slides.length;
    var slidecache = [];

    (function preloader() {
        if (slidecount < totalslide) {
            //load images
            slidecache[slidecount] = new Image();
            slidecache[slidecount].src = slides.eq(slidecount).find('img').attr('src');
            slidecache[slidecount].onload = function () {
                slidecount++;
                preloader();
            }
        }
        else {
            //run the slideshow
            slidecount = 0;
            slideshow();
        }
    }());

    function slideshow() {
        slides.eq(slidecount).fadeIn(500).delay(5000).fadeOut(500, function () {
            slidecount < totalslide - 1 ? slidecount++ : slidecount = 0;
            slideshow();
        }).css('visibility', 'visible');
    }
});