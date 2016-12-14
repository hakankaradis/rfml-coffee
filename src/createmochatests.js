require('coffee-script/register');
var inquirer = require("inquirer");
var isfileexist = require('../utils/isfileexist');
var createmochatests = require('../utils/createmochatests');
var essentialfiles = require('../utils/essentialfiles');


console.info('checking for required.json existency');
var isRequiredJsonExist = isfileexist('required.json');

console.info('checking for mapping.json existency');
var isMappingJsonExist = isfileexist('mapping.json');

if(!isRequiredJsonExist || !isMappingJsonExist){
  console.log('please do node config.js to create required.json and mapping.json');
  process.exit(1);
}


/**
** Create mocha test files
**/

createmochatests(function(){
  essentialfiles.closeEssentialFiles();
});
