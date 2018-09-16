'use strict';

module.exports = function(app){
    var api = require('../controllers/api_controller');

    app.get('/airport',api.airport);
    app.post('/search',api.search);

}