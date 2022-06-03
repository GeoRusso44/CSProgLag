const { make_data_set } = require("./make_data_set");

function Hands(){}

Hands.prototype.getStartTimes = function(){
return this.data.map(function (handData){
    //console.log(handData.startTime);
    
    return handData.startTime;
})
}

Hands.prototype.addData = function (property, source) {
    test = make_data_set(source);
    test2 = test(property);

    //console.log(test2);
    this.data.push(...test2.flat());
    return this.data;
}

Hands.prototype.getPalmPositions = function() {
return this.data.map(function (handData){
    //console.log(handData.startTime);
    
    return handData.palmPosition;
})
}

Hands.prototype.getCenterPoint = function(){
    let x = 0, y = 0, z = 0;
    let testData2 = this.getPalmPositions();
    //console.log(testData2);
    for(const vector of testData2){
        x += vector[0];
        y += vector[1];
        z += vector[2];
    }
    x = x/ testData2.length;
    y = y/ testData2.length;
    z = z/ testData2.length;
    let array = [x,y,z];
    return array;
}



let handData = new Hands();
handData.data = []
    for (let i=1; i<=10; i++){
        let source = `Data/frame-${i}.json`;
        
        handData.data = handData.addData('hands', source);     
}

//console.log(handData.data);


//let testData = handData.getStartTimes();
//let testData3 = handData.getCenterPoint();

//console.log(testData);
//console.log(testData3);

module.exports.Hands = Hands;