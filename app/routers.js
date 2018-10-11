'use strict';

module.exports = function(app){
    var api = require('../controllers/api_controller');
    var web = require('../controllers/home_controller');

    app.post('/search',api.search);
    app.post('/fare',api.fare);

    app.get('/home',web.home);

}