(function($){
  'use strict';

  /*======== 0 PRELOADER ========*/
  $(window).on('load', function () {
    $('#preloader').fadeOut(500);
  });

  /*======== 1. MENUZORD ========*/
  var menuzord = $('#menuzord');
  if (menuzord.length != 0){
    menuzord.menuzord({
      indicatorFirstLevel: '',
      indicatorSecondLevel: '',
      align: "right"
    });
  }

  /*======== 2. NAVBAR ========*/
  $(window).on('load', function () {

    var header_area = $('.header');
    var main_area = header_area.find('.nav-menuzord');
    var zero = 0;
    var navbarSticky = $('.navbar-sticky');

    $(window).scroll(function () {
      var st = $(this).scrollTop();
      if (st > zero) {
        navbarSticky.addClass('navbar-scrollUp');
      } else {
        navbarSticky.removeClass('navbar-scrollUp');
      }
      zero = st;

      if (main_area.hasClass('navbar-sticky') && ($(this).scrollTop() <= 600 || $(this).width() <= 300)) {
        main_area.removeClass('navbar-scrollUp');
        main_area.removeClass('navbar-sticky').appendTo(header_area);
        header_area.css('height', 'auto');
      } else if (!main_area.hasClass('navbar-sticky') && $(this).width() > 300 && $(this).scrollTop() > 600) {
        header_area.css('height', header_area.height());
        main_area.addClass('navbar-scrollUp');
        main_area.css({ 'opacity': '0' }).addClass('navbar-sticky');
        main_area.appendTo($('body')).animate({ 'opacity': 1 });
      }
    });

    $(window).trigger('resize');
    $(window).trigger('scroll');
  });


  /*======== 3. SELECTRIC ========*/
  var selectLocation = $('.select-location');
  if (selectLocation.length !== 0){
    selectLocation.selectric({
      arrowButtonMarkup: '<div class="arrow-button"><i class="fa fa-angle-down" aria-hidden="true"></i></div>',
    });
  }


  /*======== 4. TOOLTIP ========*/
  var dataTooltip = $('[data-toggle="tooltip"]');
  if (dataTooltip !== 0){
    dataTooltip.tooltip();
  }

  /*======== 5. BUTTON LIKE ========*/
  var btnLike = $('.btn-like');
  if (btnLike.length !== 0){
    btnLike.on('click', function () {
      $(this).find('i').toggleClass('fa-heart-o');
      $(this).find('i').toggleClass('fa-heart');
    })
  }

  /*======== 6. OWL CAROSEL ========*/
  //Popular Listing
  var populerListing = $('.popular-listing');
  if (populerListing.length !== 0){
    populerListing.owlCarousel({
      loop: true,
      autoplay: true,
      lazyLoad: true,
      margin: 30,
      dots: false,
      nav: true,
      navText: ['<i class="fa fa-angle-left " aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>' ],
      responsive: {
        320: {
          slideBy: 1,
          items: 1
        },
        768: {
          slideBy: 1,
          items: 2
        },
        992: {
          slideBy: 1,
          items: 3
        }
      }
    });
  }
  // Testimonial
  var testimonial = $('.testimonial');
  if (testimonial.length !== 0){
    testimonial.owlCarousel({
      center: true,
      loop: true,
      autoplay: true,
      autoplayTimeout: 6000,
      smartSpeed: 1000,
      // rtl: true, //For RTL
      responsive: {
        320: {
          slideBy: 1,
          items: 1,
        },
        768: {
          slideBy: 1,
          items: 1
        },
        992: {
          slideBy: 1,
          items: 3
        }
      }
    });

  }
  // Brand Slider
  var brandSlider = $('.brand-slider');
  if (brandSlider.length != 0) {
    brandSlider.owlCarousel({
      loop: true,
      margin: 28,
      autoplay: true,
      autoplayTimeout: 6000,
      autoplayHoverPause: true,
      nav: true,
      navText: ['<i class="fa fa-angle-left " aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
      dots: false,
      smartSpeed: 500,
      // rtl: true, //For RTL
      responsive: {
        320: {
          slideBy: 1,
          items: 1
        },
        768: {
          slideBy: 1,
          items: 3
        },
        992: {
          slideBy: 1,
          items: 4
        }
      }
    });

  }

  // Listing Details
  var listingDetails = $('.listing-details-carousel');
  if(listingDetails.length != 0){
    listingDetails.owlCarousel({
      loop: true,
      autoplay: true,
      autoplayTimeout: 6000,
      autoplayHoverPause: true,
      items: 4,
      nav: true,
      navText: ['<i class="fa fa-angle-left " aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
      dots: false,
      responsive: {
        320: {
          slideBy: 1,
          items: 1,
          // nav: false,
        },
        768: {
          slideBy: 1,
          items: 3
        },
        992: {
          slideBy: 1,
          items: 4
        }
      }
    });
  }

  // Blog Carousel
  var blogCarousel = $('.blog-carousel');
  if(blogCarousel.length !== 0){
    blogCarousel.owlCarousel({
      loop: true,
      autoplay: true,
      autoplayTimeout: 6000,
      autoplayHoverPause: true,
      items: 1,
      nav: true,
      navText: ['<i class="fa fa-angle-left " aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'],
      dots: false,
    })
  }

  /*======== 7. COUNTER-UP ========*/
  var counter = $('#counter');
  if (counter.length !== 0) {
    var a = 0;
    $(window).scroll(function () {
      var oTop = counter.offset().top - window.innerHeight;
      if (a === 0 && $(window).scrollTop() > oTop) {
        $('.counter-value').each(function () {
          var $this = $(this),
            countTo = $this.attr('data-count');
          $({
            countNum: $this.text()
          }).animate({
            countNum: countTo
          },
            {
              duration: 5000,
              easing: 'swing',
              step: function () {
                $this.text(Math.floor(this.countNum));
              },
              complete: function () {
                $this.text(this.countNum);
              }

            });
        });
        a = 1;
      }
    });
  }

  /*======== 8. BANNER ========*/
  // City Banner
  var city_slider = $('#rev_slider_17_1');
  if (city_slider.length !== 0 ){
    $("#rev_slider_17_1").show().revolution({
      sliderType: "standard",
      sliderLayout: "fullwidth",
      dottedOverlay: "none",
      delay: 9000,
      navigation: {
        onHoverStop: "off",
      },
      responsiveLevels: [1240, 1025, 778, 480],
      visibilityLevels: [1240, 1025, 778, 480],
      gridwidth: [1240, 1025, 778, 480],
      gridheight: [600, 500, 450, 500],
      lazyType: "smart",
      shadow: 0,
      spinner: "off",
      stopLoop: "off",
      stopAfterLoops: -1,
      stopAtSlide: -1,
      shuffle: "off",
      autoHeight: "off",
      disableProgressBar: "on",
      hideThumbsOnMobile: "off",
      hideSliderAtLimit: 0,
      hideCaptionAtLimit: 0,
      hideAllCaptionAtLilmit: 0,
      debugMode: false,
      fallbacks: {
        simplifyAll: "off",
        nextSlideOnWindowFocus: "off",
        disableFocusListener: false,
      }
    });
  }
  // Auto Mobile
  var autoMobile = $('#rev_slider_14_1');
  if(autoMobile.length !== 0){
    $("#rev_slider_14_1").show().revolution({
      sliderType: "standard",
      sliderLayout: "fullwidth",
      dottedOverlay: "none",
      delay: 9000,
      navigation: {
        onHoverStop: "off",
      },
      responsiveLevels: [1240, 1025, 778, 480],
      visibilityLevels: [1240, 1025, 778, 480],
      gridwidth: [1170, 992, 750, 450],
      gridheight: [700, 700, 650, 550],
      lazyType: "smart",
      shadow: 0,
      spinner: "off",
      stopLoop: "off",
      stopAfterLoops: -1,
      stopAtSlide: -1,
      shuffle: "off",
      autoHeight: "off",
      disableProgressBar: "on",
      hideThumbsOnMobile: "off",
      hideSliderAtLimit: 0,
      hideCaptionAtLimit: 0,
      hideAllCaptionAtLilmit: 0,
      debugMode: false,
      fallbacks: {
        simplifyAll: "off",
        nextSlideOnWindowFocus: "off",
        disableFocusListener: false,
      }
    });
  }


  /*======== 9. NEW CAR FILTERING ========*/
  // init Isotope
  var grid = $('.grid');
  if (grid.length != 0){

    var $grid = grid.isotope({
      itemSelector: '.element-item',
      layoutMode: 'fitRows'
    });
    // filter functions
    var filterFns = {
      // show if number is greater than 50
      numberGreaterThan50: function () {
        var number = $(this).find('.number').text();
        return parseInt(number, 10) > 50;
      },
      // show if name ends with -ium
      ium: function () {
        var name = $(this).find('.name').text();
        return name.match(/ium$/);
      }
    };

    // bind filter button click
    $('#filters').on('click', 'button', function () {
      var filterValue = $(this).attr('data-filter');
      // use filterFn if matches value
      filterValue = filterFns[filterValue] || filterValue;
      $grid.isotope({ filter: filterValue });
    });

    // bind sort button click
    $('#sorts').on('click', 'button', function () {
      var sortByValue = $(this).attr('data-sort-by');
      $grid.isotope({ sortBy: sortByValue });
    });

    // change is-checked class on buttons
    $('.button-group').each(function (i, buttonGroup) {
      var $buttonGroup = $(buttonGroup);
      $buttonGroup.on('click', 'button', function () {
        $buttonGroup.find('.is-checked').removeClass('is-checked');
        $(this).addClass('is-checked');
      });
    });
    // layout Isotope after each image loads
    $grid.imagesLoaded().progress(function () {
      $grid.isotope('layout');
    });
  }

  /*======== 10.  RETING ========*/
  var ratingDefault = $('.add-rating-default');
  if (ratingDefault.length != 0) {
    $('.add-rating-default').rateYo({
      "starWidth": "16px",
      "spacing": "5px",
      "starSvg": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"/></svg>'
    })
  }

  /*======== 11. DATERANGEPICKER ========*/
  var singleCalender = $('.single-date');
  if (singleCalender.length !== 0 ){
    singleCalender.daterangepicker({
      singleDatePicker: true,
      opens: 'left'
    });
  }
  var singleCalender = $('.single-date-left');
  if (singleCalender.length !== 0 ){
    singleCalender.daterangepicker({
      singleDatePicker: true
      // showDropdowns: true
    });

    singleCalender.val('');
  }
  var doubleCalender = $('.double-date');
  if (doubleCalender.length !== 0) {
    doubleCalender.daterangepicker({
      opens: 'left'
    });
  }

  /*======== 12. QUANTITY ========*/
  var incrBtn = $('.incr-btn');
  if (incrBtn.length !== 0){
    $('.incr-btn').on('click', function (e) {
      var newVal;
      var $button = $(this);
      var oldValue = $button.parent().find('.quantity').val();
      $button.parent().find('.incr-btn[data-action=decrease]').removeClass('inactive');
      if ($button.data('action') === 'increase') {
        newVal = parseFloat(oldValue) + 1;
      } else {
        // Don't allow decrementing below 1
        if (oldValue > 1) {
          newVal = parseFloat(oldValue) - 1;
        } else {
          newVal = 0;
          $button.addClass('inactive');
        }
      }
      $button.parent().find('.quantity').val(newVal);
      e.preventDefault();
    });
  }

  /*======== 13. SIMPLE TIMER ========*/
  var simple_timer = $('.simple_timer');
  if (simple_timer.length != 0){
    simple_timer.syotimer({
      year: 2020,
      month: 9,
      day: 9,
      hour: 20,
      minute: 30
    });
  }

  /*======== 14. TOOLTIP ========*/
  var tooltip = $('[data-toggle="tooltip"]');
  if (tooltip.length != 0){
    tooltip.tooltip()
  }

  /*======== 15. CLOSE BUTTON ========*/
  var closeBtn = $('.close-btn');
  if (closeBtn.length !== 0){
    closeBtn.click(function () {
      $(this).parent().hide();
    });
  }

  /*======== 16. FORM CHECK READONLY ========*/
  var formGroupCustom = $('.form-check-readonly');
  if(formGroupCustom.length !== 0) {
    var input = formGroupCustom.find('.form-check-input');

    input.change(function(){
      var formControl = $(this).parent().parent().find('.form-control')

      if($(this).prop('checked') === false ){
        formControl.attr('readonly', true)
      }
      if ($(this).prop('checked') === true) {
        formControl.removeAttr('readonly')
      }
    })
  }

  /*======== 17. DATATABLES ========*/
  var booking = $('#booking');
  if (booking.length !== 0) {
    booking.DataTable({
      language: {
        paginate: {
          previous: 'Prev'
        }
      },
      orderClasses: false,
      info: false,
      lengthChange: false,
      searching: false,
      aoColumnDefs: [{ "bSortable": false, "aTargets": [0, 3, 4, 5, 6, 7] }],
      responsive: true,
      order: [[3, 'asc']],
    });
  }

  var myBooking = $('#my-booking');
  if (myBooking.length !== 0) {
    myBooking.DataTable({
      language: {
        paginate: {
          previous: 'Prev'
        }
      },
      orderClasses: false,
      info: false,
      lengthChange: false,
      searching: false,
      aoColumnDefs: [{ "bSortable": false, "aTargets": [0, -1, -2] }],
      responsive: true,
      order: [[3, 'asc']],
    });
  }


  // Table My Reviews
  var bookingRequestMini = $('#my-reviews-lg');
  if (bookingRequestMini.length !== 0) {
    bookingRequestMini.DataTable({
      bPaginate: false,
      orderClasses: false,
      info: false,
      lengthChange: false,
      searching: false,
      aoColumnDefs: [{ "bSortable": false, "aTargets": [0, -1] }],
      responsive: true,
      order: [[1, 'asc']],
    });
  }

  // Table Reviews
  var tableReviews = $('#table-reviews');
  if (tableReviews.length !== 0) {
    tableReviews.DataTable({
      language: {
        paginate: {
          previous: 'Prev'
        }
      },
      orderClasses: false,
      info: false,
      lengthChange: false,
      searching: false,
      aoColumnDefs: [{ "bSortable": false, "aTargets": [3, 4, -1] }],
      responsive: true,
      order: [[2, 'asc']],
    });

  }


  // Admin Listing
  var adminListing = $('#admin-listing');
  if (adminListing.length !== 0) {
    adminListing.DataTable({
      language: {
        paginate: {
          previous: 'Prev'
        }
      },
      orderClasses: false,
      info: false,
      lengthChange: false,
      searching: false,
      aoColumnDefs: [{ "bSortable": false, "aTargets": [1, 2, 3, 5, 6, -1] }],
      responsive: true,
      order: [[5, 'asc']],
    });
  }

  // My favourites
  var adminListing = $('#my-favourites');
  if (adminListing.length !== 0) {
    adminListing.DataTable({
      language: {
        paginate: {
          previous: 'Prev'
        }
      },
      orderClasses: false,
      info: false,
      lengthChange: false,
      searching: false,
      aoColumnDefs: [{ "bSortable": false, "aTargets": [0, 1, -1] }],
      responsive: true,
      order: [[2, 'asc']],
    });
  }



  // My Listing
  var tableReviews = $('#my-listing');
  if (tableReviews.length !== 0) {
    tableReviews.DataTable({
      language: {
        paginate: {
          previous: 'Prev'
        }
      },
      orderClasses: false,
      info: false,
      lengthChange: false,
      searching: false,
      aoColumnDefs: [{ "bSortable": false, "aTargets": [1, 2, 3, 5, -1] }],
      responsive: true,
      order: [[4, 'asc']],
    });

  }

  // Table List owner
  var tableListOwner = $('#table-list-owner');
  if (tableListOwner.length !== 0) {
    tableListOwner.DataTable({
      language: {
        paginate: {
          previous: 'Prev'
        }
      },
      orderClasses: false,
      info: false,
      lengthChange: false,
      searching: false,
      aoColumnDefs: [{ "bSortable": false, "aTargets": [-2, -1] }],
      responsive: true,
      order: [2, 'asc'],
    });
  }

  // Table General User
  var tableGeneralUser = $('#table-general-user');
  if (tableGeneralUser.length !== 0) {
    tableGeneralUser.DataTable({
      language: {
        paginate: {
          previous: 'Prev'
        }
      },
      orderClasses: false,
      info: false,
      lengthChange: false,
      searching: false,
      aoColumnDefs: [{ "bSortable": false, "aTargets": [-2, -1] }],
      responsive: true,
      order: [1, 'asc'],
    });
  }

  /*======== 17. REPLY BUTTON ========*/
  var replyWrapper = $('.reply-wrapper');
  if (replyWrapper.length !== 0){
    $('.btn-reply').on('click', function(){
      $(this).parent().find($('.form-reply')).addClass('show');
    })
  }

  /*======== 18. PERFECT SCROLLBAR ========*/
  const message = document.querySelector('#message');
  if(message !== null){
    const ps = new PerfectScrollbar(message);
  }

  const chats = document.querySelector('#chats');
  if (chats !== null){
    const ps = new PerfectScrollbar(chats);
  }

})(jQuery);