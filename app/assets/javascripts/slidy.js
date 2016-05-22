(function () {
  /*  Prevent this script from running on other pages except the root index  */
  if (location.pathname !== "/") return false;

  /*
    ==========================
    Simple Slider v 0.0
    ==========================
  */
  var simpleSlide = {};

  simpleSlide.view = {
    imgContainer: $(".image-cluster"),
    allImages: function () {
      return this.imgContainer.children();
    },
    maxLength: function () {
      return this.allImages().length;
    },
    imgDimension: function () {
      return this.allImages()[0].width;
    }
  };

  simpleSlide.controller = {
    functionalSlide: function () {
      var ss = simpleSlide,
          moveBy = 0,
          index = 1;

      setInterval(function () {
        moveBy += ss.view.imgDimension();
        index += 1;

        if (index > (ss.view.maxLength() - 2)) {
          moveBy = 0;
          index = 1;
        }

        $.each(ss.view.allImages(), function (index, item) {
          $(item).removeClass("magnify");
        });

        ss.view.imgContainer.css({
          marginLeft: `-${moveBy}px`
        });

        ss.view.allImages().eq(index).addClass("magnify");
      }, 5000);
    }
  };

  simpleSlide.initialize = function () {
    this.controller.functionalSlide();
  };

  simpleSlide.initialize();

}());
