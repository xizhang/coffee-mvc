(function() {

  $.log = function() {
    if ($('#hidden-debug').val()) return console.log(arguments);
  };

}).call(this);
