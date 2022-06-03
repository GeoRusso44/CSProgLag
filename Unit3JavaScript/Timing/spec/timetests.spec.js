const Time = require("../my-times.js");

var testTime = new Time;
testTime.minute = 30;
testTime.hour = 2;
var testTimeMethod = new Time;
testTimeMethod.minute = 8;
testTimeMethod.hour = 3;

var testTime1 = new Time;
testTime1.minute = 200;
testTime1.hour = 0;

var testTimeMethod2 = new Time;
testTimeMethod2.minute = 532;
testTimeMethod2.hour = 0;

var testTime2 = new Time;
testTime2.minute = -10;
testTime2.hour = -50;

var testTimeMethod3 = new Time;
testTimeMethod3.minute = -5;
testTimeMethod3.hour = 0;

var testTime3 = new Time;
testTime3.minute = 0;
testTime3.hour = 0;

var testTimeMethod4 = new Time;
testTimeMethod4.minute = 0;
testTimeMethod4.hour = 0;

describe("Tets for time", function () {
    it("add the time together easily (Basic)", function () {
    (testTime.addTime(testTimeMethod));
    expect(testTime.minute).toEqual(38);
    expect(testTime.hour).toEqual(5);
    });

    it("add's together with larger min", function () {
    (testTime1.addTime(testTimeMethod2));
    expect(testTime1.minute).toEqual(12);
    expect(testTime1.hour).toEqual(12);
    });

    it("gives zero for the time if negitive numbers are used", function () {
    (testTime2.addTime(testTimeMethod3));
    expect(testTime2.minute).toEqual(0);
    expect(testTime2.hour).toEqual(0);
    });

    it("Adds two empty times together", function () {
        (testTime3.addTime(testTimeMethod4));
        expect(testTime3.minute).toEqual(0);
        expect(testTime3.hour).toEqual(0);
        });
   });