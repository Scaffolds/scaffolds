(function () {
   /*
    ==========================
    Mobile Sidebar Menu v 0.0
    ==========================
  */

  var menu = {};

  menu.view = {
    menuBtn: $(".ui.secondary.menu .mobile-menu"),
    sideBar: $(".header .mobile.sidebar"),
    closeMenuBtn: $(".header .mobile.sidebar .remove")
  };

  menu.controller = {
    showMenu: function () {
      menu.view.sideBar.removeClass("invisible");
    },
    hideMenu: function () {
      menu.view.sideBar.addClass("invisible");
    }
  };

  menu.initialize = function () {
    var self = this,
      menuBtn = self.view.menuBtn,
      closeBtn = self.view.closeMenuBtn;

    menuBtn.on("click", function () {
      self.controller.showMenu();
    });

    closeBtn.on("click", function () {
      self.controller.hideMenu();
    });
  };

  menu.initialize();
}());
