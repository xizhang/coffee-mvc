
exports.series = function(funcs, cb) {
	funcs = funcs.slice(0);
	var ress = [];

	function run(funcs, cb) {
		if(funcs.length) {
			var f = funcs.shift();
			f(function(err, res) {
				if(err)
					cb(err, ress);
				else {
					ress.push(res);
					run(funcs, cb);
				}
			});
		}
		else
			cb(null, ress);
	}

	run(funcs, cb);
};

exports.parallel = function(funcs, cb) {
	var c = typeof(funcs) === 'object' ? 
		Object.keys(funcs).length : funcs.length;
	var errs = {};
	var has_errs = false;
	var ress = {};
	if(!c)
		cb(null, ress);
	for(var k in funcs) {
		(function() {
			var f = funcs[k];
			var id = k;
			process.nextTick(function() {
				f(function(err, res) {
					if(err) {
						errs[id] = err;
						has_errs = true;
					}
					if(res)
						ress[id] = res;
					c--;
					if(c == 0)
						cb(has_errs ? errs : null, ress);
				});
			});
		})();
	}
};
