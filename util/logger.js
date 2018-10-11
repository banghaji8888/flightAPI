'use strict';
var dateFormat = require('./date');
var Logger = exports.Logger = {};

Logger.info = function(msg) {
    console.log(dateFormat.format() + " : " + msg);
};
Logger.error = function(msg) {
    console.error(dateFormat.format() + " : " + msg);
};