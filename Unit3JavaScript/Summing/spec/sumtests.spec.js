const array = require("../my-sums.js");
   describe("range with default step", function () {
    it("should decrement when start>end", function () {
    expect(array.range(5,2)).toEqual([5, 4, 3, 2]);
    });
     it("should be single when start=end", function () {
     expect(array.range(2,2)).toEqual([2]);
     });
     it("should be multiple when start<end", function (){
     expect(array.range(2,5)).toEqual([2, 3, 4, 5])
     })
   });
   
   describe("range with specified step", function () {
    it("should be empty for step increment when start>end", function () {
    expect(array.range(10,1,2)).toEqual([]);
    });
    it("should be empty for step decrement when start<end", function () {
    expect(array.range(1,10,-2)).toEqual([]);
    });
    it("should be single when step>end-start", function () {
    expect(array.range(2,4,3)).toEqual([2]);
    });
    it("should be multiple when inc |step|<|end-start|", function (){
    expect(array.range(1,10,2)).toEqual([1, 3, 5, 7, 9])
    })
    it("should be multiple when dec |step|<|end-start|", function (){
    expect(array.range(10,1,-2)).toEqual([10, 8, 6, 4, 2])
    })
   });
   
   describe("sum test cases", function () {
    it("should pass empty array", function () {
    expect(array.sum([])).toEqual(0);
    });
     it("An array with a single element", function () {
     expect(array.sum([1])).toEqual(1);
     });
     it("an array with many elements", function (){
     expect(array.sum([1,2,3,4,5,6])).toEqual(21)
     })
     it("array using range", function (){
    expect(array.sum(array.range(5,2))).toEqual(14)
    })
    it("array using range", function (){
    expect(array.sum([5,-5])).toEqual(0)
    })
   });