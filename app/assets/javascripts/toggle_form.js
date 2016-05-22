(function () {
  /*
    ==========================
    Toggler v 0.0
    ==========================
  */

  var app = {};

  app.view = {
    formContainer: $(".main-form"),
    oauthFormContainer: $(".oauth.options.group"),
    toggleItem: $(".show-main-form"),
    beCoolMsg: $(".be-cool-message")
  };

  app.controller = {
    toggleForms: function () {
      var toggleItem = app.view.toggleItem,
          oauthOptions = app.view.oauthFormContainer,
          emailForm = app.view.formContainer,
          msg = app.view.beCoolMsg;

      if (emailForm.hasClass("signup-error")) {
        emailForm.removeClass("hidden");
        oauthOptions.hide("fast");
        msg.hide();
      }

      toggleItem.on("click", function () {
        setTimeout(function () {
          msg.hide();
          oauthOptions.css("opacity", "0");
          oauthOptions.css("display", "none");
          emailForm.removeClass("hidden");
        }, 100);
      });
    }
  };

  app.init = function () {
    this.controller.toggleForms();
  };

  app.init();
}());
