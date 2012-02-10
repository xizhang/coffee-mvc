(function() {
  var mvc;

  mvc = require("./../mvc");

  exports.index = function(req, data, render) {
    data.selectedTab = "guide";
    return render(false);
  };

}).call(this);
