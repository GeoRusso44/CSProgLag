class Time {
    constructor(hour, minute) {
      this.hour = hour;
      this.minute = minute;
    }

}

Time.prototype.addTime = function (time1){
    if(this.minute < 0 || this.hour < 0 || time1.minute < 0 || time1.hour < 0){
        this.minute = 0;
        this.hour = 0;
        return;
    }
    var overflow = 0;
    this.minute = (this.minute + time1.minute);
    if (this.minute > 60){
        overflow = Math.floor(this.minute/60);
        this.minute = this.minute %60;
    }
    this.hour = (this.hour + time1.hour) + Math.floor(this.minute/60) + overflow;
}

var time3 = new Time;
var time2 = new Time;
time2.minute = 200;
time3.minute = 532;
time2.hour = 0;
time3.hour = 0;

time2.addTime(time3);
console.log(time2.hour,time2.minute)

// Use a constructor to create a Time object with hours and mins properties. Use the object’s prototype to create an
// addTime method which takes another Time object and adds it to the original time according to:
// • minutes = (total minutes) % 60
// • hours = (total hours) + floor(total minutes)/60

module.exports = Time;