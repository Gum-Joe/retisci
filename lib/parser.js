// Generated by CoffeeScript 1.10.0

/*
 * Module dependencies
 */

(function() {
  var Logger, fs, parser, path;

  fs = require('fs');

  path = require('path');

  Logger = require('./logger').Logger;

  require('colours');

  parser = module.exports = {};


  /*
   * Parse method
   *
   * @param options {Object} Options
   */

  parser.parseConfig = function(options) {
    this.logger = new Logger('redis:parser', options);
    this.file = '.retis.yml';
    if (typeof options.dir !== 'undefined') {
      this.file = options.dir + "/.retis.yml";
    }
    if (typeof options.file !== 'undefined') {
      this.logger.deb('A file was already specified.');
      this.logger.deb("File: " + ("\'" + options.file + "\'").green);
      this.file = options.file;
    }
    this.logger.deb("Parseing build specification file " + this.file + "...");
    this.logger.deb('Checking if file exists...');
    fs.stat(this.file, function(err, stat) {
      if (err) {
        this.logger.info('Error parsing build specification file!');
        throw err;
      }
      if (stat.isDirectory()) {
        this.logger.info('File specified was a directory and not a file!');
        throw new Error('File was a directory and not a file!');
      }
    });
    this.logger.deb('Found file. Parsing...');
    this.file_suffix = path.extname(this.file);
    return this.logger.deb("File Extension: " + ("\'" + this.file_suffix + "\'").green);
  };

}).call(this);