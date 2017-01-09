# rfml-coffee

## What

This module generate mocha coffee files with given rainforest `.rfml` files.

## Usage

Firstly, you must run `node src/configure.js` to generate required.json and mapping.json files.
Secondly, do `node src/createmochatests.js` to generate coffee mocha files.

#### Required.json 
json file to store full path of rainforest `.rfml` files and the full path of auto generated mocha files

E.g: 
```json
{
  "rfmlPaths": "<fullpath of rainforest files>",
  "mochaPaths": "<where to extract coffee mocha files>"
}
```

#### Mapping.json
It is kind of dependency graph of rainforest files. It holds all information about rfml file.


E.g:
```json
{
  "clone_stack_template": {
    "id": "2fa800c1-be4c-4834-9343-736a2889a77a",
    "startUri": "/",
    "testCount": 14,
    "steps": [
      {
        "description": "Click on 'Create a Stack for Your Team' section",
        "asserts": [
          "Do you see 'Select a Provider' title",
          "Do you see 'amazon web services', 'VAGRANT', 'Google Cloud Platform', 'DigitalOcean', 'Azure', 'Marathon' and 'Softlayer'",
          "Do you see 'CANCEL' and 'CREATE STACK' buttons below?"
        ]
      }, { ... } ,
    ],
    "tag": " automated",
    "embedded": {
      "name": "create_team_with_existing_account",
      "id": "1ae7b10f-f120-47de-bc67-eae94efbd491"
    }
```
