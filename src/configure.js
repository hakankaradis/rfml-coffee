require('coffee-script/register');
var inquirer = require('inquirer');
var savefile = require('../utils/savefile.coffee');
var createmappingjson = require('../utils/createmappingjson.coffee');

var questionList = [
  {
    name: 'rfmlPaths',
    message: 'Where is your rfml files (full path)'
  },
  {
    name: 'mochaPaths',
    message: 'Where do you want to extract mocha test files'
  }
];

var generateMapping = [{
  name: 'mapping',
  message: ''
}];

var prompt = inquirer.createPromptModule();
prompt(questionList).then(function(res){
  savefile('./required.json', JSON.stringify(res, null, 2), function() {
    console.info('required saved');
    console.info('creating mapping.json');
    createmappingjson(function(){
      console.info('mapping.json is created');
    });
  });
});