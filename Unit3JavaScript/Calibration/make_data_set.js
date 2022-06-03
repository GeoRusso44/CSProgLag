const { read_json_file } = require("./read_json_file");

function make_data_set(source) {
    var rawData;
    
    var data = [];
    function add(property){
        rawData = read_json_file(source);
        //console.log(rawData);
        //for in loop for parsing to put in data set
        
        Object.keys(rawData).forEach(function(key)
        {if(key === property){
            data.push(rawData[key]);
        }});
        return data;
    }
    return add;
   }

   module.exports.make_data_set = make_data_set;
//    var test = [];
//    test = make_data_set("./Data/frame-2.json");
//    var test2 = test("hands");
//    console.log(test2);