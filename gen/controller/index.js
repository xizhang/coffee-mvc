(function() {
  var mvc;

  mvc = require("./../mvc");

  exports.index = function(req, data, render) {
    data.selectedTab = "overview";
    return render(false);
  };

}).call(this);
