const { Hands } = require("./hands");

let handData = new Hands();
handData.data = []
    for (let i=1; i<=10; i++){
        let source = `Data/frame-${i}.json`;
        
        handData.data = handData.addData('hands', source);     
}

let startTime = handData.getStartTimes();
let centerPoint = handData.getCenterPoint();

for (let i=0; i<centerPoint.length ; i++){
    //console.log(centerPoint.length);
    centerPoint[i] = centerPoint[i].toFixed(2);
}

console.log('Shift: [' + centerPoint + "]");
console.log("--based on frames collected between "+ Math.min.apply(Math, startTime)+ 'ms and ' + Math.max.apply(Math, startTime)+ 'ms');
// Finally – write a calibration script that create a new Hands object, adds data from the data files provided, calculates the
// CenterPoint, and displays the coordinates, along with a statement about the time duration of the frames used to calibrate.
// Use the example output below as a guide (your values may vary):
// Shift: [ '-25.32', '303.95', '6.23' ]
// --based on frames collected between 1668ms and 5002ms

