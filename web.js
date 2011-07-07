(function() {
  var connect, options, server, sharejs, sys;
  connect = require('connect');
  sharejs = require('share').server;
  sys = require('sys');
  server = connect(connect.favicon(__dirname + '/public/favicon.ico'), connect.logger(), connect.static(__dirname + '/public'), connect.router(function(app) {
    var wiki;
    wiki = require('./editor');
    app.get('/doc/?', function(req, res, next) {
      res.writeHead(301, {
        location: '/doc/default'
      });
      return res.end();
    });
    return app.get('/doc/:docName', function(req, res, next) {
      var docName;
      docName = req.params.docName;
      return wiki(docName, server.model, res, next);
    });
  }));
  options = {
    db: {
      type: 'redis'
    }
  };
  sharejs.attach(server, options);
  server.listen(8000);
  sys.puts('Demos running at http://localhost:8000/');
}).call(this);