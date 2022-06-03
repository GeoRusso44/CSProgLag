let fs = require('fs');
function read_json_file(filename) {
    if (fs.existsSync(filename)) {
    console.log(filename);
 let contents = fs.readFileSync(filename);
 return JSON.parse(contents);
    }
    return {};
}
module.exports.read_json_file = read_json_file;